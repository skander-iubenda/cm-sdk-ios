//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 09.02.23.
//

import Foundation


protocol CmpImportConsentDelegate {
    func didReceiveImportResult(success: Bool, message: String?)
}
