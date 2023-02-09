////
////  File.swift
////
////
////  Created by Skander Ben Abdelmalak on 08.02.23.
////
import UIKit
import SwiftUI
import WebKit

final class ConsentWebView: NSObject, UIViewRepresentable {
    let layout: CGRect
    let url: URL
    let callbacks: CmpWebViewDelegate
    
    init(layout: CGRect, url: URL, callbacks: CmpWebViewDelegate) {
        self.layout = layout
        self.url = url
        self.callbacks = callbacks
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return createWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    private func createWebView() -> WKWebView {
        let consentScriptString = """
            var cmpToSDK_sendStatus = function(consent,jsonObject) {
            jsonObject.cmpApiKey = consent;
            window.webkit.messageHandlers.consent.postMessage(jsonObject); };
            var cmpToSDK_showConsentLayer = function(open) { window.webkit.messageHandlers.open.postMessage(open);};
            window.onerror = function(error) { window.webkit.messageHandlers.error.postMessage(error); };
        """

        let consentScript = WKUserScript(source: consentScriptString, injectionTime: .atDocumentEnd, forMainFrameOnly: true)

        let contentController = WKUserContentController()
        contentController.addUserScript(consentScript)
        contentController.add(self, name: "consent")
        contentController.add(self, name: "open")
        contentController.add(self, name: "error")

        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        let webView = WKWebView(frame: layout, configuration: configuration)
        return webView
    }
}

extension ConsentWebView: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "consent":
            guard let consent = message.body as? [String: Any], let cmpKey = consent["cmpApiKey"] as? String else { return }
            callbacks.onConsent(consent:cmpKey, jsonObject: consent)
        case "open":
            callbacks.onOpen()
        case "error":
            guard let error = message.body as? Error else { return }
            callbacks.onError(error: error)
        default:
            break
    }
}
}

struct ConsentWebViewController: View {
    let layout: CGRect
    let callbacks: CmpWebViewDelegate
    let url : URL
    var body: some View {
        ConsentWebView(layout: layout, url: url, callbacks: callbacks)
    }
}
