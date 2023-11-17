//
//  Data.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on November 16, 2023
//
import Foundation

struct Data: Codable {

	let id: Int
	let name: String
	let symbol: String
	let slug: String
	let numMarketPairs: Int
	let dateAdded: String
	let tags: [String]
	let infiniteSupply: Bool
	let platform: Any?
	let cmcRank: Int
	let selfReportedCirculatingSupply: Any?
	let selfReportedMarketCap: Any?
	let tvlRatio: Any?
	let lastUpdated: String
	let quote: Quote

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case symbol = "symbol"
		case slug = "slug"
		case numMarketPairs = "num_market_pairs"
		case dateAdded = "date_added"
		case tags = "tags"
//		case maxSupply = "max_supply"
//		case circulatingSupply = "circulating_supply"
//		case totalSupply = "total_supply"
		case infiniteSupply = "infinite_supply"
		case platform = "platform"
		case cmcRank = "cmc_rank"
		case selfReportedCirculatingSupply = "self_reported_circulating_supply"
		case selfReportedMarketCap = "self_reported_market_cap"
		case tvlRatio = "tvl_ratio"
		case lastUpdated = "last_updated"
		case quote = "quote"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decode(Int.self, forKey: .id)
		name = try values.decode(String.self, forKey: .name)
		symbol = try values.decode(String.self, forKey: .symbol)
		slug = try values.decode(String.self, forKey: .slug)
		numMarketPairs = try values.decode(Int.self, forKey: .numMarketPairs)
		dateAdded = try values.decode(String.self, forKey: .dateAdded)
		tags = try values.decode([String].self, forKey: .tags)
        infiniteSupply = try values.decode(Bool.self, forKey: .infiniteSupply)
		platform = nil // TODO: Add code for decoding `platform`, It was null at the time of model creation.
		cmcRank = try values.decode(Int.self, forKey: .cmcRank)
		selfReportedCirculatingSupply = nil // TODO: Add code for decoding `selfReportedCirculatingSupply`, It was null at the time of model creation.
		selfReportedMarketCap = nil // TODO: Add code for decoding `selfReportedMarketCap`, It was null at the time of model creation.
		tvlRatio = nil // TODO: Add code for decoding `tvlRatio`, It was null at the time of model creation.
		lastUpdated = try values.decode(String.self, forKey: .lastUpdated)
		quote = try values.decode(Quote.self, forKey: .quote)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(name, forKey: .name)
		try container.encode(symbol, forKey: .symbol)
		try container.encode(slug, forKey: .slug)
		try container.encode(numMarketPairs, forKey: .numMarketPairs)
		try container.encode(dateAdded, forKey: .dateAdded)
		try container.encode(tags, forKey: .tags)
//		try container.encode(maxSupply, forKey: .maxSupply)
//		try container.encode(circulatingSupply, forKey: .circulatingSupply)
//		try container.encode(totalSupply, forKey: .totalSupply)
		try container.encode(infiniteSupply, forKey: .infiniteSupply)
		// TODO: Add code for encoding `platform`, It was null at the time of model creation.
		try container.encode(cmcRank, forKey: .cmcRank)
		// TODO: Add code for encoding `selfReportedCirculatingSupply`, It was null at the time of model creation.
		// TODO: Add code for encoding `selfReportedMarketCap`, It was null at the time of model creation.
		// TODO: Add code for encoding `tvlRatio`, It was null at the time of model creation.
		try container.encode(lastUpdated, forKey: .lastUpdated)
		try container.encode(quote, forKey: .quote)
	}

}
