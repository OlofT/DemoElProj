//
//  DemoElTests.swift
//  DemoElTests
//
//  Created by Olof Thorén on 2023-04-12.
//

import XCTest
import Combine
@testable import DemoEl

final class DemoElTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApplianceJSONCodable() throws {
        
		let data = """
		{
			"applianceId": "12CFD",
			"applianceData": {
				"applianceName": "My oven",
			},
			"properties": {
				"doorState": "CLOSED",
				"temperatureRepresentation": "CELSIUS",
				"targetTemperature": 80,
				"program": "GRILL",
				"startTime": -1,
				"targetDuration": 0,
				"runningTime": 0,
				"applianceState": "READY_TO_START",
				"displayTemperature": 24
			}
		}
		"""
		
		let decoded = try JSONDecoder().decode(Appliance.self, from: data.data(using: .utf8)!)
		XCTAssertTrue(decoded.applianceData.applianceName == "My oven")
		XCTAssertTrue(decoded.properties.temperatureRepresentation == .celsius)
		XCTAssertTrue(decoded.properties.targetTemperature == 80)
		XCTAssertTrue(decoded.properties.startTime == nil)
    }
	
	var listeners = Set<AnyCancellable>()
	func testFetchAppliance() throws {
		
		let exp = expectation(description: "Can fetch locally")
		let fetcher = DataManager(networkHandler: LocalMockFetcher(), user: User())
		try fetcher.fetchAppliances()
			.sink(receiveCompletion: { _ in }, receiveValue: { decoded in
				
				XCTAssertTrue(decoded.applianceData.applianceName == "My oven")
				XCTAssertTrue(decoded.properties.temperatureRepresentation == .celsius)
				XCTAssertTrue(decoded.properties.targetTemperature == 80)
				XCTAssertTrue(decoded.properties.startTime == nil)
				
				exp.fulfill()
			})
			.store(in: &listeners)
		
		wait(for: [exp], timeout: 3)
	}

    func _testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
