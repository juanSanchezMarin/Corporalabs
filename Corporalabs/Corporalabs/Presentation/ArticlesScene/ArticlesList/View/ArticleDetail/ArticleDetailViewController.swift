//
//  ArticleDetailViewController.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 4/1/22.
//

import Foundation

import UIKit
import WebKit

final class ArticleDetailViewController: UIViewController, WKNavigationDelegate, StoryboardInstantiable {

    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        guard let url = URL(string: "https://www.nytimes.com/2022/01/13/opinion/january-6-civil-war.html") else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
