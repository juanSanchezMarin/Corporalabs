//
//  Constants.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 29/12/21.
//

import Foundation

struct Constants {
    struct APIinfo {
        /// Add your own public key in Schemes -> Edit Scheme -> Environment Variables -> PUBLIC_KEY.
        static let publicKey = ProcessInfo.processInfo.environment["PUBLIC_KEY"] ?? ""
        static let applicationType = "application/json"
    }

    struct Paths {
        static let base = "https://api.nytimes.com/svc/mostpopular/v2/"
        static let articles = "/v1/public/articles"
    }
}
