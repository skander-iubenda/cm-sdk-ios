//
//  File 2.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation
import UIKit

class CmpConfig {
    // Required Properties
    static let shared = CmpConfig()
    private init() {}
    
    var id: String = ""
    var appName: String = ""
    var domain: String = ""
    var language: String = ""
    
    // Domain Properties
    var settingsPage: Bool = false
    var attStatus: Int?
    var attActive: Bool = false

    
    // Layer Configs
    var customLayoutActive: Bool = false
    var customLayout: CGRect?
    
    var modalTransitionStyle: NSInteger? = UIModalPresentationStyle.overFullScreen.rawValue
    var backgroundColor: UIColor?
    
    
    // Config Properties
    var verboseLevel: Int = 0
    var timeout: Int = 6000
   
    init(id: String, appName: String, domain: String, language: String) {
        self.id = id
        self.appName = appName
        self.domain = domain
        self.language = language
    }
    
    func configure(id: String, appName: String, domain: String, language: String) {
        self.id = id
        self.appName = appName
        self.domain = domain
        self.language = language
    }
    
    func activateAtt(with status: Int) -> CmpConfig {
        attStatus = status
        attActive = true
        return self
    }
    
    func deactivateAtt() -> CmpConfig {
        attStatus = nil
        attActive = false
        return self
    }
    
    func urlConfig() -> CmpConfigURLParams {
        return CmpConfigURLParams(id: id, appName: appName, domain: domain, language: language, settingsPage: settingsPage, attStatus: attStatus)
    }
    
    func activateCustomLayout(with layout: CGRect) -> CmpConfig {
        customLayout = layout
        customLayoutActive = true
        return self
    }
    
    func deactivateCustomLayout() -> CmpConfig {
        customLayout = nil
        customLayoutActive = false
        return self
    }
    
    func setModalTransitionStyle(style: NSInteger) -> CmpConfig {
        modalTransitionStyle = style
        return self
    }
    
    func setBackgroundColor(color: UIColor?) -> CmpConfig {
        backgroundColor = color
        return self
    }
    
    func setVerboseLevel(level: Int) -> CmpConfig {
        verboseLevel = level
        return self
    }
    
    func setTimeout(time: Int) -> CmpConfig {
        timeout = time
        return self
    }
    
    
}

class CmpConfigURLParams {
    let id: String
    let appName: String
    let domain: String
    let language: String
    let settingsPage: Bool
    let attStatus: Int?
    
    init(id: String, appName: String, domain: String, language: String, settingsPage: Bool, attStatus: Int?) {
        self.id = id
        self.appName = appName
        self.domain = domain
        self.language = language
        self.settingsPage = settingsPage
        self.attStatus = attStatus
    }
}
