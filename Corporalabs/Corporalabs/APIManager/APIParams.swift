//
//  APIParams.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 29/12/21.
//

// MARK: - ApiParams

public struct APIParams {
    public var articleType: String
    public var lastDaysType: String
    public var sharedFacebook: Bool?
    public var sharedTwitter: Bool?
}

enum APIResult: Int {
    case success, error
}
