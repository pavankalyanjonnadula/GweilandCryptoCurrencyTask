//
//  Status.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on November 16, 2023
//
import Foundation

struct Status: Codable {

	let timestamp: String
	let errorCode: Int
	let errorMessage: String?
	let elapsed: Int
	let creditCount: Int
	let notice: String?
	let totalCount: Int

	private enum CodingKeys: String, CodingKey {
		case timestamp = "timestamp"
		case errorCode = "error_code"
		case errorMessage = "error_message"
		case elapsed = "elapsed"
		case creditCount = "credit_count"
		case notice = "notice"
		case totalCount = "total_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		timestamp = try values.decode(String.self, forKey: .timestamp)
		errorCode = try values.decode(Int.self, forKey: .errorCode)
		errorMessage = nil // TODO: Add code for decoding `errorMessage`, It was null at the time of model creation.
		elapsed = try values.decode(Int.self, forKey: .elapsed)
		creditCount = try values.decode(Int.self, forKey: .creditCount)
		notice = nil // TODO: Add code for decoding `notice`, It was null at the time of model creation.
		totalCount = try values.decode(Int.self, forKey: .totalCount)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(timestamp, forKey: .timestamp)
		try container.encode(errorCode, forKey: .errorCode)
		// TODO: Add code for encoding `errorMessage`, It was null at the time of model creation.
		try container.encode(elapsed, forKey: .elapsed)
		try container.encode(creditCount, forKey: .creditCount)
		// TODO: Add code for encoding `notice`, It was null at the time of model creation.
		try container.encode(totalCount, forKey: .totalCount)
	}

}
