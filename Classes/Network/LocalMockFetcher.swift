//
//  LocalMockFetcher.swift
//  DemoEl
//
//  Created by Olof Thorén on 2023-04-13.
//

import Foundation

class LocalMockFetcher: DataFetcher {
	
	func fetchAppliances(_ user: User) throws -> AppliancePublisher {
		
		Bundle.main.url(forResource: "Oven", withExtension: "json")
			.publisher
			.delay(for: 0.5, scheduler: RunLoop.main)	//add a delay to mimic network latency
			.tryMap { url in
				try JSONDecoder().decode(Appliance.self, from: Data(contentsOf: url))
			}
			.eraseToAnyPublisher()
	}
}
