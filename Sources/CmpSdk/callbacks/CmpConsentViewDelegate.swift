//
//  File.swift
//  CmpSdk
//
//  Created by Skander Ben Abdelmalak on 09.02.23.
//

import Foundation


@objc protocol CmpConsentViewDelegate: AnyObject {
    @objc optional func consentViewDidOpen(_ view: ConsentWebView)
    @objc optional func consentViewDidClose(_ view: ConsentWebView)
    @objc optional func consentViewDidNotOpen(_ view: ConsentWebView)
    @objc optional func consentViewEncounteredError(_ message: String)
}
