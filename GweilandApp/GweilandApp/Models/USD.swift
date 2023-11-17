//
//  USD.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on November 16, 2023
//
import Foundation

struct USDQuote: Codable {

	let price: Double
	let volume24h: Double
	let volumeChange24h: Double
	let percentChange1h: Double
	let percentChange24h: Double
	let percentChange7d: Double
	let percentChange30d: Double
	let percentChange60d: Double
	let percentChange90d: Double
	let marketCap: Double
	let marketCapDominance: Double
	let fullyDilutedMarketCap: Double
	let tvl: Any?
	let lastUpdated: String

	private enum CodingKeys: String, CodingKey {
		case price = "price"
		case volume24h = "volume_24h"
		case volumeChange24h = "volume_change_24h"
		case percentChange1h = "percent_change_1h"
		case percentChange24h = "percent_change_24h"
		case percentChange7d = "percent_change_7d"
		case percentChange30d = "percent_change_30d"
		case percentChange60d = "percent_change_60d"
		case percentChange90d = "percent_change_90d"
		case marketCap = "market_cap"
		case marketCapDominance = "market_cap_dominance"
		case fullyDilutedMarketCap = "fully_diluted_market_cap"
		case tvl = "tvl"
		case lastUpdated = "last_updated"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		price = try values.decode(Double.self, forKey: .price)
		volume24h = try values.decode(Double.self, forKey: .volume24h)
		volumeChange24h = try values.decode(Double.self, forKey: .volumeChange24h)
		percentChange1h = try values.decode(Double.self, forKey: .percentChange1h)
		percentChange24h = try values.decode(Double.self, forKey: .percentChange24h)
		percentChange7d = try values.decode(Double.self, forKey: .percentChange7d)
		percentChange30d = try values.decode(Double.self, forKey: .percentChange30d)
		percentChange60d = try values.decode(Double.self, forKey: .percentChange60d)
		percentChange90d = try values.decode(Double.self, forKey: .percentChange90d)
		marketCap = try values.decode(Double.self, forKey: .marketCap)
		marketCapDominance = try values.decode(Double.self, forKey: .marketCapDominance)
		fullyDilutedMarketCap = try values.decode(Double.self, forKey: .fullyDilutedMarketCap)
		tvl = nil // TODO: Add code for decoding `tvl`, It was null at the time of model creation.
		lastUpdated = try values.decode(String.self, forKey: .lastUpdated)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(price, forKey: .price)
		try container.encode(volume24h, forKey: .volume24h)
		try container.encode(volumeChange24h, forKey: .volumeChange24h)
		try container.encode(percentChange1h, forKey: .percentChange1h)
		try container.encode(percentChange24h, forKey: .percentChange24h)
		try container.encode(percentChange7d, forKey: .percentChange7d)
		try container.encode(percentChange30d, forKey: .percentChange30d)
		try container.encode(percentChange60d, forKey: .percentChange60d)
		try container.encode(percentChange90d, forKey: .percentChange90d)
		try container.encode(marketCap, forKey: .marketCap)
		try container.encode(marketCapDominance, forKey: .marketCapDominance)
		try container.encode(fullyDilutedMarketCap, forKey: .fullyDilutedMarketCap)
		// TODO: Add code for encoding `tvl`, It was null at the time of model creation.
		try container.encode(lastUpdated, forKey: .lastUpdated)
	}

}
