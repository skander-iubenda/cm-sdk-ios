import XCTest
@testable import CmpSdk

final class CmpSdkTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
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
                }
            ],
            "createdAt": "2023-02-08T08:23:59.000Z",
            "updatedAt": "2023-02-08T08:23:59.000Z"
        }
        """.data(using: .utf8)!
        //let consent = JSONDecoder().decode(ConsentData.self, from: jsonData)
    }
    
    
}
