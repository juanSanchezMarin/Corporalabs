//
//  AppCoordinator.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 2/1/22.
//

import UIKit

public class AppCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer

    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let articlesSceneDIContainer = appDIContainer.makeArticlesSceneDIContainer()
        let flow = articlesSceneDIContainer.makeArticlesCoordinator(navigationController: self.navigationController)
        flow.start()
    }
}
