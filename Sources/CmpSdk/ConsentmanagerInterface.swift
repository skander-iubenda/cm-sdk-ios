//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 07.02.23.
//

import Foundation


protocol ConsentmanagerInterface {
        func initialize(config: [String: Any], cmpService: String, callbackWrapper: (() -> Void)?)
    
        func calledThisDay() -> Bool
        func needsAcceptance() -> Bool //Deprecated
    
        func getAllPurposes() -> [String]
        func getAllPurposeList() -> [String: Any]
    
        func getAgreedPurposes() -> [String]
        func getAgreedPurposeList() -> [String: Any]
    
        func getAllVendors() -> [String]
        func getAllVendorsList() -> [String: Any]
    
        func getAgreedVendors() -> [String]
        func getAgreedVendorList() -> [String: Any]
    
        func getUSPrivacyString() -> String
        func getGoogleACString() -> String
    
        func hasVendor(vendorId: String) -> Bool
        func hasPurpose(purposeId: String) -> Bool
        
        static func hasConsent() -> Bool
        static func needsServerUpdate() -> Bool
        static func importConsentString() -> Void
        static func exportConsentString() -> String
    
        func enableVendorList()
        func disableVendorList()
        func enablePurposeList()
        func disablePurposeList()
        func rejectAll()
        func acceptAll()
        
    
    
        func openConsentLayer()
}
