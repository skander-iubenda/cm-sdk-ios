import Foundation
import SwiftUI
import UIKit

struct CmpSdk {
    
    init(id: String, domain: String, appName: String, language: String) {
        CmpConfig.shared.configure(id: id, appName: appName, domain: domain, language: language)
        ConsentService.shared.delegate = DefaultConsentViewDelegate()
    }
    
    init(config : CmpConfig) {
        
    }
    
    func setConsentViewDelegate(delegate: CmpConsentViewDelegate) {
        ConsentService.shared.delegate = delegate
    }
    
    
//    func initialize(config: [String : Any], cmpService: String, callbackWrapper: (() -> Void)?) {
//
//    }

    func calledLast() -> Bool {
        return true
    }

    func needsAcceptance() -> Bool {
        return true
    }

    func getAllPurposes() -> [String] {
        return []
    }

    func getAllPurposeList() -> [String : Any] {
        return [:]
    }

    func getEnabledPurposes() -> [String] {
        return []
    }

    func getEnabledPurposeList() -> [String : Any] {
        return [:]
    }

    func getAllVendors() -> [String] {
        return []
    }

    func getAllVendorsList() -> [String : Any] {
        return [:]
    }

    func getEnabledVendors() -> [String] {
        return []
    }

    func getEnabledVendorList() -> [String : Any] {
        return [:]
    }
    
    func getDisabledVendorList() -> [String] {
        return []
    }
    
    func getDisabledPurposeList() -> [String] {
        return []
    }

    func getUSPrivacyString() -> String {
        return "us privacy String"
    }

    func getGoogleACString() -> String {
        return "google String"
    }

    func hasVendor(vendorId: String) -> Bool {
        // TODO code
        return true
    }

    func hasPurpose(purposeId: String) -> Bool {
        return true
    }

    static func hasConsent() -> Bool {
        return true
    }

    static func importConsentString(consentString : String) {
        print("importing: " + consentString)
    }

    static func exportConsentString() -> String {
        return "export"
    }

    func enableVendorList() {
        print("enabling vendors")
    }

    func disableVendorList() {
        print("disabling vendors")
    }

    func enablePurposeList() {
        print("enabling purposes")
    }

    func disablePurposeList() {
        print("disabling purposes")
    }

    func rejectAll() {
        print("rejecting All")
    }

    func acceptAll() {
        print("accepting All")
    }
//
    func openLayer() {
        guard let url : URL = URLBuilder(config: CmpConfig.shared).build() else {
            return
        }

        
        let layout = CGRect(x: 0, y: 0, width: 400, height: 600)
        let callbacks: CmpWebViewDelegate = {
            class AnonymousCmpWebViewDelegate: CmpWebViewDelegate {
                func didReceivedConsentData(consent: String, jsonObject: [String: Any]) {
                    print("received Consent")
                    // Handle received consent data
                }
                
                func didOpenConsentView() {
                    print("open Consent")
                    // Handle consent view opening
                }
                
                func didEncounterConsentError(message: String) {
                    // Handle consent erro
                    print("error")

                }
                init() {} // Add an initializer that takes no arguments
            }
            return AnonymousCmpWebViewDelegate()
        }()

        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        let consentWebViewController = ConsentWebViewController(layout: layout, delegate: callbacks, url: url)
        let hostingController = UIHostingController(rootView: consentWebViewController)
        hostingController.modalPresentationStyle = .overCurrentContext
        window.rootViewController?.present(hostingController, animated: true, completion: nil)
    }
}
