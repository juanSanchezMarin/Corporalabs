//
//  Article.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 30/12/21.
//

struct Article: Decodable {
    let id: Int
    let title: String?
    let author: String?
    let section: String?
    let published_date: String?
    let media: [Media]?
    let url: String?
}

struct Media: Decodable {
    let media_metadata: [Images]?
    let type: String?

    enum CodingKeys : String, CodingKey {
        case media_metadata = "media-metadata"
        case type = "type"
    }
}

struct Images: Decodable {
    let url: String?
}
