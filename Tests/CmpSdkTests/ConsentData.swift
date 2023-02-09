//
//  ConsentData.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import XCTest
@testable import CmpSdk

final class ConsentData: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//        func testDeserialization() {
//            let jsonData = """
//            {
//                "consentstring": "",
//                "uspstring": "",
//                "gdprApplies": true,
//                "hasGlobalScope": true,
//                "tcfversion": 2,
//                "tcfcaversion": 1,
//                "gppversions": [1,2,3],
//                "tcfcompliant": true,
//                "regulation": 1,
//                "regulationKey": "",
//                "purposeConsents": {
//                    "1": true
//                },
//                "vendorConsents": {
//                    "1": true
//                },
//                "purposeLI": {
//                    "1": true
//                },
//                "vendorLI": {
//                    "1": true
//                },
//                "googleVendorConsents": {
//                    "1": true
//                },
//                "vendorsList": [
//                    {
//                        "id": "1",
//                        "iabid": 1,
//                        "systemid": "",
//                        "googleid": 1,
//                        "name": "",
//                        "purposes": ["1", "2", "3"]
//                    }
//                ],
//                "publisherCC": "",
//                "addtlConsent": "",
//                "purposesList": [
//                    {
//                        "id": "1"
//                    }
//                ],
//                "purModeActive": true,
//                "purModeLoggedIn": true,
//                "purModeLogic": 1,
//                "consentExists": true,
//                "userChoiceExists": true,
//                "metadata": [
//                    {
//                        "name": "",
//                        "value": 1,
//                        "type": ""
//                    }
//                ],
//                "createdAt": "2023-02-08T08:23:59.000Z",
//                "updatedAt": "2023-02-08T08:23:59.000Z"
//            }
//            """.data(using: .utf8)!
//
//            do {
//                let consent = JSONDecoder().decode(ConsentData.self, from: jsonData)
//                let consentData = try JSONDecoder().decode(ConsentData.self, from: jsonData)
//                print(consentData)
//            } catch {
//                print(error)
//            }
//        }
//
//    func testSerialization() {
//        let purpose1 = Purpose(id: "1")
//        let purpose2 = Purpose(id: "2")
//        let purposesList = [purpose1, purpose2]
//        let vendorData1 = Vendor(id: "1", iabId: 1, systemId: "system1", googleId: 1, name: "Vendor1", purposes: ["1", "2"])
//        let vendorData2 = Vendor(id: "2", iabId: 2, systemId: "system2", googleId: 2, name: "Vendor2", purposes: ["1"])
//        let vendorsList = [vendorData1, vendorData2]
//        let metadata1 = Metadata(name: "meta1", value: 1, type: "type1")
//        let metadata2 = Metadata(name: "meta2", value: 2, type: "type2")
//        let metadata = [metadata1, metadata2]
//        let now = Date()
//        let consentData = ConsentData()
//
//        do {
//            let encoder = JSONEncoder()
//            encoder.dateEncodingStrategy = .iso8601
//            let data = try encoder.encode(consentData)
//            let jsonString = String(data: data, encoding: .utf8)!
//            print(jsonString)
//
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .iso8601
//            let decodedData = try decoder.decode(ConsentData.self, from: data)
//            print(decodedData)
//        } catch {
//            print(error)
//        }
//    }

}
