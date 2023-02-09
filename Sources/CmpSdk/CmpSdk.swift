import Foundation
import UIKit

public struct CmpSdk {
    
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
//        <#code#>
//    }
//
//    func calledThisDay() -> Bool {
//        <#code#>
//    }
//
//    func needsAcceptance() -> Bool {
//        <#code#>
//    }
//
//    func getAllPurposes() -> [String] {
//        <#code#>
//    }
//
//    func getAllPurposeList() -> [String : Any] {
//        <#code#>
//    }
//
//    func getAgreedPurposes() -> [String] {
//        <#code#>
//    }
//
//    func getAgreedPurposeList() -> [String : Any] {
//        <#code#>
//    }
//
//    func getAllVendors() -> [String] {
//        <#code#>
//    }
//
//    func getAllVendorsList() -> [String : Any] {
//        <#code#>
//    }
//
//    func getAgreedVendors() -> [String] {
//        <#code#>
//    }
//
//    func getAgreedVendorList() -> [String : Any] {
//        <#code#>
//    }
//
//    func getUSPrivacyString() -> String {
//        <#code#>
//    }
//
//    func getGoogleACString() -> String {
//        <#code#>
//    }
//
//    func hasVendor(vendorId: String) -> Bool {
//        <#code#>
//    }
//
//    func hasPurpose(purposeId: String) -> Bool {
//        <#code#>
//    }
//
//    static func hasConsent() -> Bool {
//        <#code#>
//    }
//
//    static func needsServerUpdate() -> Bool {
//        <#code#>
//    }
//
//    static func importConsentString() {
//        <#code#>
//    }
//
//    static func exportConsentString() -> String {
//        <#code#>
//    }
//
//    func enableVendorList() {
//        <#code#>
//    }
//
//    func disableVendorList() {
//        <#code#>
//    }
//
//    func enablePurposeList() {
//        <#code#>
//    }
//
//    func disablePurposeList() {
//        <#code#>
//    }
//
//    func rejectAll() {
//        <#code#>
//    }
//
//    func acceptAll() {
//        <#code#>
//    }
//
    func openLayer() {
        guard let url : URL = URLBuilder(config: CmpConfig.shared).build() else {
            return
        }

        
        let layout = CGRect(x: 0, y: 0, width: 400, height: 600)
        var callbacks: CmpWebViewDelegate = {
            class WebViewCallbackImplementation : CmpWebViewDelegate {
                func didReceivedConsentData(consent: String, jsonObject: [String : Any]) {
                    ConsentService.saveConsent(dictionary: jsonObject)
                }
                
                func didOpenConsentView() {
                    
                    <#code#>
                }
                
                func didEncounterConsentError(message: String) {
                    print(message)
                }
                
                
            }
            
        } as! CmpWebViewDelegate
        let customWebViewController = ConsentWebViewController(layout: layout, callbacks: callbacks, url: url)
        let topViewController = UIApplication.shared.keyWindow?.rootViewController
            topViewController?.present(customWebViewController, animated: true, completion: nil)
    }
}
