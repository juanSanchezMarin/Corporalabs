//
//  ArticlesListViewController.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 2/1/22.
//

import Foundation

import UIKit

final class ArticlesListViewController: UITableViewController, StoryboardInstantiable {

    private var viewModel: ArticlesListViewModel!

    static func create(with viewModel: ArticlesListViewModel) -> ArticlesListViewController {
        let view = ArticlesListViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ArticlesListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.items.value.count)
        return viewModel.items.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesListItemCell.reuseIdentifier,
                                                       for: indexPath) as? ArticlesListItemCell else {
            assertionFailure("Cannot dequeue reusable cell \(ArticlesListItemCell.self) with reuseIdentifier: \(ArticlesListItemCell.reuseIdentifier)")
            return UITableViewCell()
        }

       cell.fill(with: viewModel.items.value[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = ArticleDetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
