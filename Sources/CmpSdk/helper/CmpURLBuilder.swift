//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation

class URLBuilder {
    private let baseDomain = "https://%@/delivery/appcmp_v3.php"
    
    private var appName: String? = nil
    private var id: String = ""
    private var language: String? = nil
    private var serverDomain: String = ""
    
    private var attStatus : Int? = nil
    private var settingsPage = false

    private var idfa: String? = nil
    private var consent: String? = ""
    
    private var addPurposes = ""
    private var addVendors = ""
    
    private var rejectAll = false
    private var acceptAll = false

    private var forceOpen = true
   
    init(config : CmpConfig) {
        self.serverDomain = CmpConfig.shared.domain
        self.id = CmpConfig.shared.id
        self.language = CmpConfig.shared.language
        self.appName = CmpConfig.shared.appName
        self.settingsPage = CmpConfig.shared.settingsPage
        
        if(CmpConfig.shared.attActive) {
            self.attStatus = CmpConfig.shared.attStatus
        }
    }
    
    func setConsent(_ consent: String) -> URLBuilder {
        self.consent = consent
        return self
    }
    
    
    func setAddVendors(_ addVendors: String) -> URLBuilder {
        self.addVendors = addVendors
        return self
    }
    
    func setIdfa(_ idfa: String) -> URLBuilder {
        self.idfa = idfa
        return self
    }
    
    func setAddPurposes(_ addPurposes: String) -> URLBuilder {
        self.addPurposes = addPurposes
        return self
    }
    
    func setRejectAll(_ rejectAll: Bool) -> URLBuilder {
        self.rejectAll = rejectAll
        return self
    }
    
    func setAcceptAll(_ acceptAll: Bool) -> URLBuilder {
        self.acceptAll = acceptAll
        return self
    }
    
    func setSettingsPage(_ settingsPage: Bool) -> URLBuilder {
        self.settingsPage = settingsPage
        return self
    }
    
    func setForceOpen(_ forceOpen: Bool) -> URLBuilder {
        self.forceOpen = forceOpen
        return self
    }
    
    private func setId(_ id: String) -> URLBuilder {
        self.id = id
        return self
    }
    
    
   private func setLanguage(_ language: String) -> URLBuilder {
        self.language = language
        return self
    }
    
    private func setAppName(_ appName: String) -> URLBuilder {
        self.appName = appName
        return self
    }
    
    
    private func setServerDomain(_ serverDomain: String) -> URLBuilder {
        self.serverDomain = serverDomain
        return self
    }

    func build() -> URL? {
        var urlString = String(format: baseDomain, serverDomain)
        urlString += "?id=\(id)"
        
        if let idfa = idfa {
            urlString += "&idfa=\(idfa)"
        }
        
        if let language = language {
            urlString += "&language=\(language)"
        }
        
        if let appName = appName {
            urlString += "&app_name=\(appName)"
        }
        
        if let consent = consent {
            urlString += "&consent=\(consent)"
        }
        return URL(string: urlString)
    }

}
