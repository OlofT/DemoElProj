//
//  Appliance.swift
//  DemoEl
//
//  Created by Olof Thorén on 2023-04-12.
//

import Foundation

struct Appliance: Codable {
	let applianceId: String
	var applianceData: ApplianceData
	var properties: ApplianceProperties
}

struct ApplianceData: Codable {
	let applianceName: String
}

struct ApplianceProperties: Codable {
	var doorState: DoorState
	var temperatureRepresentation: TemperatureRepresentation
	var targetTemperature: Int
	var program: OvenProgram
	@TimeStampDate var startTime: Date?
	var targetDuration: TimeInterval
	var runningTime: TimeInterval
	var applianceState: ApplianceState
	var displayTemperature: Int
}

enum DoorState: String, Codable, CaseIterable {
	case closed = "CLOSED"
}

enum TemperatureRepresentation: String, Codable, CaseIterable {
	case celsius = "CELSIUS"
}

enum ApplianceState: String, Codable, CaseIterable {
	case off = "READY_TO_START"
	case on = "IS_ON"
}

enum OvenProgram: String, Codable, CaseIterable {
	case grill = "GRILL"
}

/// TimeStampDate returns nil if the JSON value is negative, which makes sure we have a regular timestamp (from 1970)
@propertyWrapper public struct TimeStampDate : Codable {
	public let wrappedValue: Date?
	
	public init(wrappedValue: Date?) {
		self.wrappedValue = wrappedValue
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let value = try? container.decode(Double.self),
			value >= 0 {
			self.wrappedValue = Date(timeIntervalSince1970: value)
		}
		else {
			self.wrappedValue = nil
		}
	}
}
