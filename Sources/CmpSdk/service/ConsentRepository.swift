//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 07.02.23.
//

import Foundation

class ConsentRepository {
    static let key = "CMP_CONSENT"
    static let keyCreatedAt = "CMP_CREATED_AT"
    static let keyUpdatedAt = "CMP_UPDATED_AT"
    static let keyMetalist = "CMP_METALIST"
    static let separator = ","

    static func get() -> ConsentData? {
        
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
         let updatedAt  = UserDefaults.standard.double(forKey: keyUpdatedAt)
         let createdAt  = UserDefaults.standard.double(forKey: keyCreatedAt)

        let decoder = JSONDecoder()
        
        do {
            var consentData = try decoder.decode(ConsentData.self, from: data)
            consentData.updatedAt = Date(timeIntervalSince1970: updatedAt)
            consentData.createdAt = Date(timeIntervalSince1970: createdAt)
            return consentData
        } catch {
            print("Error decoding consentData object: \(error)")
            return nil
        }
    }
    
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.removeObject(forKey: keyUpdatedAt)
        UserDefaults.standard.removeObject(forKey: keyCreatedAt)
        removeMetalist()
    }

    static func save(_ consentData: ConsentData) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(consentData)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Error encoding consentData object: \(error)")
        }
    }
    
    
    static func save(_ jsonData: Data) {
        do {
            let decoder = JSONDecoder()
            let consentData = try decoder.decode(ConsentData.self, from: jsonData)
            saveMetalist(consentData.metadata)
            
            // only write createdAt if no data is saved yet
            if(self.get() == nil) {
                UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: keyCreatedAt)
            }
            UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: keyUpdatedAt)
            
            UserDefaults.standard.set(jsonData, forKey: key)
        } catch {
            print("Error decoding JSON data: \(error)")
        }
    }

    static func getMetadata() -> [(String, String)] {
        let metaListKeys = UserDefaults.standard.string(forKey: keyMetalist)?.components(separatedBy: separator)
        var metaData = [(String, String)]()

        if let keys = metaListKeys {
            for key in keys {
                let value = UserDefaults.standard.string(forKey: key)
                metaData.append((key, value ?? ""))
            }
        }

        return metaData
    }
    
    private static func saveMetalist(_ metalist : Array<Metadata>) {
        // saving list of meta keys
        UserDefaults.standard.set(metalist.map { $0.name }.joined(separator: separator), forKey: keyMetalist)
        // saving meta key - value pairs
        for metadata in metalist {
            UserDefaults.standard.set(metadata.value, forKey: metadata.name)
        }
    }
    
    private static func removeMetalist() {
        if let metalist = UserDefaults.standard.string(forKey: keyMetalist) {
            let metalistArray = metalist.components(separatedBy: separator)
            for metadataName in metalistArray {
                UserDefaults.standard.removeObject(forKey: metadataName)
            }
        }
        UserDefaults.standard.removeObject(forKey: keyMetalist)
    }
    
    static func getKeyValuePairsFromUserDefaults() -> [String: Any] {
        return UserDefaults.standard.dictionaryRepresentation()
    }
}

