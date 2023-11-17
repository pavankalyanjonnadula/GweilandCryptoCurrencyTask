//
//  Quote.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on November 16, 2023
//
import Foundation

struct Quote: Codable {

	let USD: USDQuote

	private enum CodingKeys: String, CodingKey {
		case USD = "USD"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        USD = try values.decode(USDQuote.self, forKey: .USD)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(USD, forKey: .USD)
	}

}
