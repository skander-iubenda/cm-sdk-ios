//
//  File.swift
//  CmpSdk
//
//  Created by Skander Ben Abdelmalak on 09.02.23.
//

import Foundation


class DefaultConsentViewDelegate: CmpConsentViewDelegate {
    // Implement the methods from the CmpConsentViewDelegate protocol here
    func consentViewEncounteredError(_ message: String) {
        print(message)
    }
    func consentViewDidOpen(_ view: ConsentWebView) {
        print("ConsentView did open")
    }
    
    func consentViewDidNotOpen(_ view: ConsentWebView) {
        print("ConsentView did not open")
    }
    
    func consentViewDidClose(_ view: ConsentWebView) {
        print("ConsentView did close")
    }
}
