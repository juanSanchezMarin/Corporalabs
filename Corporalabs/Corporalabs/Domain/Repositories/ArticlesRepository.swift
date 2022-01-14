//
//  ArticlesRepository.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 12/1/22.
//

import Foundation

protocol ArticlesRepository {
    func fetchArticlesList(params: APIParams,
                         completion: @escaping (Result<[Article]?, Error>) -> Void)
}

final class DefaultArticlesRepository: ArticlesRepository {

    private let apiManager: APIManager

    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}

extension DefaultArticlesRepository {

    public func fetchArticlesList(params: APIParams,
                                  completion: @escaping (Result<[Article]?, Error>) -> Void) {

        self.apiManager.fetchArticlesServer(params: params) { result, articles in
           switch result {
               case .success: completion(.success(articles))
               case .error: print("Error")
           }
        }
    }
}
