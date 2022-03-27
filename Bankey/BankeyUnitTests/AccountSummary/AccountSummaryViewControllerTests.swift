//
//  AccountSummaryViewControllerTests.swift
//  BankeyUnitTests
//
//  Created by Micaella Morales on 3/26/22.
//

import XCTest

@testable import Bankey

class AccountSummaryViewControllerTests: XCTestCase {
    var vc: AccountSummaryViewController!
    var mockManager: MockProfileManager!
    
    class MockProfileManager: ProfileManageable {
        var profile: Profile?
        var error: NetworkError?
        
        func fetchProfile(forUserId userId: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
            completion(.success(profile!))
        }
    }
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
        // vc.loadViewIfNeeded()
        
        mockManager = MockProfileManager()
        vc.profileManager = mockManager
    }
    
    func getErrorInfoForServerError() throws {
        let errorInfo = vc.getErrorInfoForTesting(for: .serverError)
        XCTAssertEqual("Server Error", errorInfo.title)
        XCTAssertEqual("We could not process your request. Please try again.", errorInfo.message)
    }
    
    func getErrorInfoForDecodingError() throws {
        let errorInfo = vc.getErrorInfoForTesting(for: .decodingError)
        XCTAssertEqual("Network Error", errorInfo.title)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", errorInfo.message)
    }
    
    func testAlertForServerError() throws {
        mockManager.error = NetworkError.serverError
        vc.forceFetchProfile()
        
        XCTAssertEqual("Server Error", vc.errorAlert.title)
        XCTAssertEqual("We could not process your request. Please try again.", vc.errorAlert.message)
    }
    
    func testAlertForDecodingError() throws {
        mockManager.error = NetworkError.decodingError
        vc.forceFetchProfile()
        
        XCTAssertEqual("Network Error", vc.errorAlert.title)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", vc.errorAlert.message)
    }
    
}
