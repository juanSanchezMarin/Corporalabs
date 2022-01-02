//
//  Articles.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 30/12/21.
//

struct Articles: Decodable {
  let count: Int
  let all: [Article]

  enum CodingKeys: String, CodingKey {
    case count = "num_results"
    case all = "results"
  }
}
