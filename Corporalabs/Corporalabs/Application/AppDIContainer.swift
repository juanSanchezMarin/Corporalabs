//
//  AppDIContainer.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 10/1/22.
//

import Foundation

final class AppDIContainer {

    // MARK: - Network
    lazy var apiManager: APIManager = APIManager()

    // MARK: - DIContainers of scenes
    func makeArticlesSceneDIContainer() -> ArticlesSceneDIContainer {
        let dependencies = ArticlesSceneDIContainer.Dependencies(apiManager: self.apiManager)
        return ArticlesSceneDIContainer(dependencies: dependencies)
    }
}
