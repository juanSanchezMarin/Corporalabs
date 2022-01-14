//
//  ArticlesCoordinator.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 10/1/22.
//

import UIKit

protocol ArticlesCoordinatorDependencies  {
    func makeMainViewController(actions: ArticlesListViewModelActions) -> ViewController
    func makeArticlesListViewController(actions: ArticlesListViewModelActions) -> ArticlesListViewController
    func makeArticlesDetailsViewController(article: Article) -> UIViewController
}

final class ArticlesCoordinator {

    private weak var navigationController: UINavigationController?
    private let dependencies: ArticlesCoordinatorDependencies

    private weak var articlesListVC: ViewController?

    init(navigationController: UINavigationController,
         dependencies: ArticlesCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let actions = ArticlesListViewModelActions(showArticleDetails: showArticleDetails)
        let vc = self.dependencies.makeMainViewController(actions: actions)
        self.navigationController?.pushViewController(vc, animated: false)
        self.articlesListVC = vc
    }

    private func showArticleDetails(article: Article) {
        let vc = dependencies.makeArticlesDetailsViewController(article: article)
        navigationController?.pushViewController(vc, animated: true)
    }
}
