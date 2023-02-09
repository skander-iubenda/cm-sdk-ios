//
//  ConsentRepositoryTests.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import XCTest
import CmpSdk
@testable import CmpSdk

final class ConsentRepositoryTests: XCTestCase {

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
    
    
    func testSaving() {
        let jsonData = """
        {
            "consentstring": "",
            "uspstring": "",
            "gdprApplies": true,
            "hasGlobalScope": true,
            "tcfversion": 2,
            "tcfcaversion": 1,
            "gppversions": [1,2,3],
            "tcfcompliant": true,
            "regulation": 1,
            "regulationKey": "",
            "purposeConsents": {
                "1": true
            },
            "vendorConsents": {
                "1": true
            },
            "purposeLI": {
                "1": true
            },
            "vendorLI": {
                "1": true
            },
            "googleVendorConsents": {
                "1": true
            },
            "vendorsList": [
                {
                    "id": "1",
                    "iabid": 1,
                    "systemid": "",
                    "googleid": 1,
                    "name": "",
                    "purposes": ["1", "2", "3"]
                }
            ],
            "publisherCC": "",
            "addtlConsent": "",
            "purposesList": [
                {
                    "id": "1"
                }
            ],
            "purModeActive": true,
            "purModeLoggedIn": true,
            "purModeLogic": 1,
            "consentExists": true,
            "userChoiceExists": true,
            "metadata": [
                {
                    "name": "",
                    "value": 1,
                    "type": ""
                },
                        {
                            "name": "test",
                            "value": 100000001,
                            "type": ""
                        }
            ],
        }
        """.data(using: .utf8)!
        
        ConsentRepository.save(jsonData)
        
        let cmpConsent = ConsentRepository.get()
        XCTAssertEqual(cmpConsent?.userChoiceExists, true)
        let metalist = ConsentRepository.getMetadata()
        let userdefaults = ConsentRepository.getKeyValuePairsFromUserDefaults()
        ConsentRepository.remove()
        let data = ConsentRepository.getMetadata()
    }
    
    func testGettingMetalist() {

    }
}
