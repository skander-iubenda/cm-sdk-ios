//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation

internal protocol CmpWebViewDelegate {
  func didReceivedConsentData(consent: String, jsonObject: [String: Any])
  func didOpenConsentView()
  func didEncounterConsentError(message: String)
}
