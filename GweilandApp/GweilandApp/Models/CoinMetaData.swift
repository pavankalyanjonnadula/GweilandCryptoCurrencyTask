//
//  CoinMetaData.swift
//  GweilandApp
//
//  Created by Jonnadula Pavan Kalyan  on 17/11/23.
//

import Foundation



struct CoinMetaData: Codable {
    let status: CoinMetaData_Status
    let data: [String: CoinMetaData_Coin]
}

struct CoinMetaData_Status: Codable {
    let timestamp: String
    let errorCode: Int
    let errorMessage: String?
    let elapsed: Int
    let creditCount: Int
    let notice: String?
    
    private enum CodingKeys: String, CodingKey {
        case timestamp, errorCode = "error_code", errorMessage = "error_message", elapsed, creditCount = "credit_count", notice
    }
}

struct CoinMetaData_Coin: Codable {
    let id: Int?
    let name: String?
    let symbol: String?
    let category: String?
    let description: String?
    let slug: String?
    let logo: String?
    let subreddit: String?
    let notice: String?
    let tags: [String]?
    let tagNames: [String]?
    let tagGroups: [String]?
    let dateAdded: String?
    let twitterUsername: String?
    let isHidden: Int?

    private enum CodingKeys: String, CodingKey {
        case id, name, symbol, category, description, slug, logo, subreddit, notice, tags, tagNames = "tag-names", tagGroups = "tag-groups", dateAdded = "date_added", twitterUsername, isHidden
    }
}

