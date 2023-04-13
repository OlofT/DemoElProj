//
//  DataFetcher.swift
//  DemoEl
//
//  Created by Olof Thorén on 2023-04-13.
//

import Foundation
import Combine

typealias AppliancePublisher = AnyPublisher<Appliance, Error>

class DataManager {
	
	// a handler for the requests to allow for dependency injection
	let networkHandler: DataFetcher
	// a user object to control authentication
	let user: User?
	
	init(networkHandler: DataFetcher, user: User?) {
		self.networkHandler = networkHandler
		self.user = user
	}
	
	func fetchAppliances() throws -> AppliancePublisher {
		guard let user else {
			throw URLError(.userAuthenticationRequired)
		}
		return try networkHandler.fetchAppliances(user)
	}
}

/// Store user specific values, settings, etc fetched from server at authentication, a cookie like object.
class User {
	// empty due to not part of the assignment
}
