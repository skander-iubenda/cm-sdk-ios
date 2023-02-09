//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation

struct ConsentData: Codable {
    
    let consentString: String
    let uspString: String
    let gdprApplies: Bool
    let hasGlobalScope: Bool
    let tcfVersion: Int
    let tcfcaVersion: Int
    let gppVersions: [Int]
    let tcfCompliant: Bool
    let regulation: Int
    let regulationKey: String
    let purposeConsents: [String: Bool]
    let vendorConsents: [String: Bool]
    let purposeLi: [String: Bool]
    let vendorLi: [String: Bool]
    let googleVendorConsents: [String: Bool]
    let vendorsList: [Vendor]
    let publisherCC: String
    let addtlConsent: String
    let purposesList: [Purpose]
    let purModeActive: Bool
    let purModeLoggedIn: Bool
    let purModeLogic: Int
    let consentExists: Bool
    let userChoiceExists: Bool
    let metadata: [Metadata]
    var createdAt: Date?
    var updatedAt: Date?

    
    init(consentString: String = "",
         uspString: String = "",
         gdprApplies: Bool = false,
         hasGlobalScope: Bool = false,
         tcfVersion: Int = 0,
         tcfcaVersion: Int = 0,
         gppVersions: [Int] = [],
         tcfCompliant: Bool = false,
         regulation: Int = 0,
         regulationKey: String = "",
         purposeConsents: [String: Bool] = [:],
         vendorConsents: [String: Bool] = [:],
         purposeLi: [String: Bool] = [:],
         vendorLi: [String: Bool] = [:],
         googleVendorConsents: [String: Bool] = [:],
         vendorsList: [Vendor] = [],
         publisherCC: String = "",
         addtlConsent: String = "",
         purposesList: [Purpose] = [],
         purModeActive: Bool = false,
         purModeLoggedIn: Bool = false,
         purModeLogic: Int = 0,
         consentExists: Bool = false,
         userChoiceExists: Bool = false,
         metadata: [Metadata] = []) {
        
        self.consentString = consentString
        self.uspString = uspString
        self.gdprApplies = gdprApplies
        self.hasGlobalScope = hasGlobalScope
        self.tcfVersion = tcfVersion
        self.tcfcaVersion = tcfcaVersion
        self.gppVersions = gppVersions
        self.tcfCompliant = tcfCompliant
        self.regulation = regulation
        self.regulationKey = regulationKey
        self.purposeConsents = purposeConsents
        self.vendorConsents = vendorConsents
        self.purposeLi = purposeLi
        self.vendorLi = vendorLi
        self.googleVendorConsents = googleVendorConsents
        self.vendorsList = vendorsList
        self.publisherCC = publisherCC
        self.addtlConsent = addtlConsent
        self.purposesList = purposesList
        
        self.purModeLoggedIn = purModeLoggedIn
        self.purModeLogic = purModeLogic
        self.purModeActive = purModeActive
        
        self.consentExists = consentExists
        self.userChoiceExists = userChoiceExists
        
        self.metadata = metadata
        
        self.createdAt = nil
        self.updatedAt = nil
        
    }
    
    static func createEmpty() -> ConsentData {
        return ConsentData()
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        consentString = try values.decode(String.self, forKey: .consentString)
        uspString = try values.decode(String.self, forKey: .uspString)
        gdprApplies = try values.decode(Bool.self, forKey: .gdprApplies)
        hasGlobalScope = try values.decode(Bool.self, forKey: .hasGlobalScope)
        tcfVersion = try values.decode(Int.self, forKey: .tcfVersion)
        tcfcaVersion = try values.decode(Int.self, forKey: .tcfcaVersion)
        gppVersions = try values.decode([Int].self, forKey: .gppVersions)
        tcfCompliant = try values.decode(Bool.self, forKey: .tcfCompliant)
        regulation = try values.decode(Int.self, forKey: .regulation)
        regulationKey = try values.decode(String.self, forKey: .regulationKey)
        purposeConsents = try values.decode([String: Bool].self, forKey: .purposeConsents)
        vendorConsents = try values.decode([String: Bool].self, forKey: .vendorConsents)
        purposeLi = try values.decode([String: Bool].self, forKey: .purposeLi)
        vendorLi = try values.decode([String: Bool].self, forKey: .vendorLi)
        googleVendorConsents = try values.decode([String: Bool].self, forKey: .googleVendorConsents)
        vendorsList = try values.decode([Vendor].self, forKey: .vendorsList)
        publisherCC = try values.decode(String.self, forKey: .publisherCC)
        addtlConsent = try values.decode(String.self, forKey: .addtlConsent)
        purposesList = try values.decode([Purpose].self, forKey: .purposesList)
        purModeActive = try values.decode(Bool.self, forKey: .purModeActive)
        purModeLoggedIn = try values.decode(Bool.self, forKey: .purModeLoggedIn)
        purModeLogic = try values.decode(Int.self, forKey: .purModeLogic)
        consentExists = try values.decode(Bool.self, forKey: .consentExists)
        userChoiceExists = try values.decode(Bool.self, forKey: .userChoiceExists)
        metadata = try values.decode([Metadata].self, forKey: .metadata)
        createdAt = nil
        updatedAt = nil
    }

    private enum CodingKeys: String, CodingKey {
        case consentString = "consentstring"
        case uspString = "uspstring"
        case gdprApplies
        case hasGlobalScope
        case tcfVersion = "tcfversion"
        case tcfcaVersion = "tcfcaversion"
        case gppVersions = "gppversions"
        case tcfCompliant = "tcfcompliant"
        case regulation
        case regulationKey = "regulationKey"
        case purposeConsents = "purposeConsents"
        case vendorConsents = "vendorConsents"
        case purposeLi = "purposeLI"
        case vendorLi = "vendorLI"
        case googleVendorConsents = "googleVendorConsents"
        case vendorsList = "vendorsList"
        case publisherCC = "publisherCC"
        case addtlConsent = "addtlConsent"
        case purposesList = "purposesList"
        case purModeActive = "purModeActive"
        case purModeLoggedIn = "purModeLoggedIn"
        case purModeLogic = "purModeLogic"
        case consentExists = "consentExists"
        case userChoiceExists = "userChoiceExists"
        case metadata = "metadata"
    }

    func hasVendor(vendorId : String) -> Bool {
        return vendorConsents.keys.contains(vendorId)
    }
    
    func hasPurpose(purposeId : String) -> Bool {
        return purposeConsents.keys.contains(purposeId)
    }
    
    func getAllPurposes() -> Array<String> {
        return purposesList.map { $0.id }
    }
    
    func getAllVendors() -> Array<String> {
        return vendorsList.map { $0.id }
    }
    
    func getAgreedPurposes() -> Array<String> {
        return Array(purposeConsents.keys)
    }
    
    func getAgreedVendors() -> Array<String> {
        return Array(vendorConsents.keys)
    }
    
    func hasConsent() -> Bool {
        return userChoiceExists
    }
}
