//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation


class ConsentService {
    static let shared = ConsentService()
    var delegate: CmpConsentViewDelegate

    private init() {
        self.delegate = DefaultConsentViewDelegate()
    }
    
    static func saveConsent(dictionary : [String : Any]) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            ConsentRepository.save(jsonData)
            // Use jsonData as a Data object
        } catch {
            // Handle error
            shared.delegate.consentViewEncounteredError?("The consent data can not be saved")
        }
    }
    
    static func hasVendor(vendorId: String) -> Bool {
        guard let consent = ConsentRepository.get() else {
            return false
        }
        return consent.hasVendor(vendorId: vendorId)
    }
    
    static func hasPurpose(purposeId: String) -> Bool {
        guard let consent = ConsentRepository.get() else {
            return false
        }
        return consent.hasPurpose(purposeId: purposeId)
    }

    
    static func importConsent(consent: String) {
        // 1. creating url
        // implement the delegate in a way that webview won't open
        // 2. opening webview
        // waiting for response
        // importing
    }
    
    static func exportConsentString() -> String {
        let consent = ConsentRepository.get()?.consentString
        return consent ?? ""
    }
}
