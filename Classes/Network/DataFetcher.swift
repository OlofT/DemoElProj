//
//  NetworkHandler.swift
//  DemoEl
//
//  Created by Olof Thorén on 2023-04-13.
//

import Foundation

protocol DataFetcher {
	func fetchAppliances(_ user: User) throws -> AppliancePublisher
}

// This is just an example-stub of how switching between fetching from network and from local file could be done.
class NetworkFetcher {
	
	let baseURL = URL(string: "http://localhost/")
	func fetchAppliances(_ user: User) throws -> AppliancePublisher {
		
		guard let url = baseURL?.appending(path: "appliances") else {
			throw URLError(.badURL)
		}
		return URLSession.shared.dataTaskPublisher(for: url)
			.tryMap({ (data: Data, response: URLResponse) in
				try JSONDecoder().decode(Appliance.self, from: data)
			})
			.eraseToAnyPublisher()
	}
}
