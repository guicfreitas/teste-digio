//
//  TesteDigioTests.swift
//  TesteDigioTests
//
//  Created by João Guilherme on 14/07/22.
//

import XCTest
@testable import TesteDigio

class TesteDigioTests: XCTestCase {

    var sut: URLSession!

    override func setUpWithError() throws {
      try super.setUpWithError()
      sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }

    func testValidApiCallGetsHTTPStatusCode200() throws {

      let urlString = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
      let url = URL(string: urlString)!

      let promise = expectation(description: "Status code: 200")

      let dataTask = sut.dataTask(with: url) { _, response, error in

        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {

            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()

      wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
