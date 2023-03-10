//
//  MyAnimeAppTests.swift
//  MyAnimeAppTests
//
//  Created by EasyPOS iOS Dev on 2/27/23.
//

import XCTest
import Alamofire
@testable import MyAnimeApp

final class MyAnimeAppTests: XCTestCase {

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
        if let animeURL = URL(string: "https://animechan.vercel.app/api/random") {
            AF.request(
                animeURL,
                method: .get
            ).responseDecodable(of: Quote.self) { response in
                switch response.result {
                case .success(let quote):
                    XCTAssertNotEqual(quote.quote, "")
                case .failure(let error):
                    XCTAssertNotEqual(error.localizedDescription, "")
                }
            }
        }
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
