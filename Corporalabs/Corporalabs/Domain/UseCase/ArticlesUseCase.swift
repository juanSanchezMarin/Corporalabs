//
//  ArticlesUseCase.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 12/1/22.
//

import Foundation

protocol ArticlesUseCase {
    func execute(params: APIParams,
                 completion: @escaping (Result<[Article]?, Error>) -> Void)
}

final class DefaultArticlesUseCase: ArticlesUseCase {

    private let articlesRepository: ArticlesRepository


    init(articlesRepository: ArticlesRepository) {
        self.articlesRepository = articlesRepository
    }

    func execute(params: APIParams,
                 completion: @escaping (Result<[Article]?, Error>) -> Void) {

        articlesRepository.fetchArticlesList(params: params,
                                                    completion: { result in

            completion(result)
        })
    }
}
