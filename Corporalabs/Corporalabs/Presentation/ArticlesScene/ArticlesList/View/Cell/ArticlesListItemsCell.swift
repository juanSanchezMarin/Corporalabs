//
//  ArticlesListItemsCell.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 12/1/22.
//

import Foundation
import UIKit

final class ArticlesListItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ArticlesListItemCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!

    func fill(with viewModel: ArticlesListItemViewModel) {
        self.titleLabel.text = viewModel.title
        self.authorLabel.text = viewModel.author
        self.sectionLabel.text = viewModel.section
        self.publicationDateLabel.text = viewModel.date
    }
}
