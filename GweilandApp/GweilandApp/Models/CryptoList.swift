//
//  CryptoList.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on November 16, 2023
//
import Foundation

struct CryptoList: Codable {

	let status: Status
	let data: [Data]

	private enum CodingKeys: String, CodingKey {
		case status = "status"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decode(Status.self, forKey: .status)
		data = try values.decode([Data].self, forKey: .data)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(status, forKey: .status)
		try container.encode(data, forKey: .data)
	}

}