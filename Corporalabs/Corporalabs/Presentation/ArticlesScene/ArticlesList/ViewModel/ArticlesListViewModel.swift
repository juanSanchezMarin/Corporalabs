//
//  ArticlesListViewModel.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 9/1/22.
//

import Foundation

struct ArticlesListViewModelActions {
    let showArticleDetails: (Article) -> Void
}

protocol ArticlesListViewModelInput {
    func viewDidLoad()
    func loadArticles(params: APIParams)
    func didSelectItem(at index: Int)
}

protocol ArticlesListViewModelOutput {
    var items: Observable<[ArticlesListItemViewModel]> { get }
    var error: Observable<String> { get }
    var isEmpty: Bool { get }
    var errorTitle: String { get }
}

protocol ArticlesListViewModel: ArticlesListViewModelInput, ArticlesListViewModelOutput {}

final class DefaultArticlesListViewModel: ArticlesListViewModel {

    private let articlesUseCase: ArticlesUseCase
    private let actions: ArticlesListViewModelActions?

    // MARK: - OUTPUT

    let items: Observable<[ArticlesListItemViewModel]> = Observable([])
    let error: Observable<String> = Observable("")
    var isEmpty: Bool { return items.value.isEmpty }
    let errorTitle = NSLocalizedString("Error", comment: "")

    // MARK: - Init

    init(articlesUseCase: ArticlesUseCase, actions: ArticlesListViewModelActions? = nil) {
        self.articlesUseCase = articlesUseCase
        self.actions = actions
    }

    // MARK: - Private

    private func handle(error: Error) {
    }
}

// MARK: - INPUT. View event methods

extension DefaultArticlesListViewModel {

    func viewDidLoad() { }

    func loadArticles(params: APIParams) {
        articlesUseCase.execute(params: params) { result in
            switch result {
                case .success(let data):
                    guard let data = data else { return }
                    self.items.value = data.map({ article in
                        return ArticlesListItemViewModel.init(article: article)
                    })
                    print(self.items.value)
                case .failure(let error): print("Error")
            }
        }
    }

    func didSelectItem(at index: Int) {
        //actions?.showArticleDetails(articles[index])
    }
}
