//
//  ArticlesSceneDIContainer.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 9/1/22.
//

import UIKit
import SwiftUI

final class ArticlesSceneDIContainer {

    struct Dependencies {
        let apiManager: APIManager
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Use Cases
    func makeArticlesUseCase() -> ArticlesUseCase {
        return DefaultArticlesUseCase(articlesRepository: makeArticlesRepository())
    }

    // MARK: - Repositories
    func makeArticlesRepository() -> ArticlesRepository {
        return DefaultArticlesRepository(apiManager: dependencies.apiManager)
    }

    // MARK: - Articles List

    func makeMainViewController(actions: ArticlesListViewModelActions) -> ViewController {
        return ViewController.create(with: makeArticlesListViewModel(actions: actions))
    }
    
    func makeArticlesListViewController(actions: ArticlesListViewModelActions) -> ArticlesListViewController {
        return ArticlesListViewController.create(with: makeArticlesListViewModel(actions: actions))
    }

    func makeArticlesListViewModel(actions: ArticlesListViewModelActions) -> ArticlesListViewModel {
        return DefaultArticlesListViewModel(articlesUseCase: makeArticlesUseCase(), actions: actions)
    }

    // MARK: - Article Details
    func makeArticlesDetailsViewController(article: Article) -> UIViewController {
        //return ArticleDetailViewController.create(with: makeArticlesDetailsViewModel(article: article))
        return ArticleDetailViewController()
    }

    // MARK: - Flow Coordinators
    func makeArticlesCoordinator(navigationController: UINavigationController) -> ArticlesCoordinator {
        return ArticlesCoordinator.init(navigationController: navigationController,
                                   dependencies: self)
    }
}

extension ArticlesSceneDIContainer: ArticlesCoordinatorDependencies {
}
