//
//  ArticlesListItemViewModel.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 9/1/22.
//

import Foundation

struct ArticlesListItemViewModel: Equatable {
    let title: String?
    let author: String?
    let section: String?
    let date: String?
    let url: String?
    let image: String?
}

extension ArticlesListItemViewModel {

    init(article: Article) {
        self.title = article.title
        self.author = article.author
        self.section = article.section
        self.date = article.published_date
        self.url = article.url
        if article.media != nil && article.media!.count > 0 {
            if article.media![0].media_metadata != nil && article.media![0].media_metadata!.count > 0 {
                self.image = article.media![0].media_metadata?[0].url
            }
            else {
                self.image = nil
            }
        }
        else {
            self.image = nil
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
