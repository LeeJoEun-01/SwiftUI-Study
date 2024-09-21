//
//  ArticleDTO.swift
//  Assignment
//
//  Created by 이조은 on 12/26/23.
//

import Foundation

// MARK: - ArticleDTO
struct ArticleDTO: Codable {
    let articles: [Article]
    let articlesCount: Int
}

// MARK: - Article
struct Article: Codable, Hashable {
    let slug, title, description, body: String
    let tagList: [String]
    let createdAt, updatedAt: String
    let favorited: Bool
    let favoritesCount: Int
    let author: Author
}

// MARK: - Author
struct Author: Codable, Hashable {
    let username: String
    let bio: JSONNull?
    let image: String
    let following: Bool
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
