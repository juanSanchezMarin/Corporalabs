//
//  ViewController.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 29/12/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController, StoryboardInstantiable {

    @IBOutlet weak var articleTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var lastDaysSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sharedFacebookSwitch: UISwitch!
    @IBOutlet weak var sharedTwitterSwitch: UISwitch!
    @IBOutlet weak var searchbutton: UIButton!
    @IBOutlet weak var sharedOptionsView: UIView!

    let articleTypes: [String] = ["mostemailed", "mostshared", "mostviewed"]
    let lastDaysTypes: [String] = ["1", "7", "30"]
    var showSharedOptions: Bool = false {
        didSet {
            self.sharedOptionsView.isHidden = !showSharedOptions
        }
    }
    var viewModel: ArticlesListViewModel!

    static func create(with viewModel: ArticlesListViewModel) -> ViewController {
        let view = ViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    private func bind(to viewModel: ArticlesListViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
    }

    private func updateItems() {
        if !viewModel.isEmpty {
            let viewController: ArticlesListViewController = ArticlesListViewController.create(with: viewModel)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    func configureView() {
        self.sharedFacebookSwitch.isOn = false
        self.sharedTwitterSwitch.isOn = false
        self.sharedOptionsView.isHidden = true
        self.articleTypeSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        self.articleTypeSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        self.searchbutton.addTarget(self, action: #selector(searchArticles(_:)), for: .touchUpInside)
    }

    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: showSharedOptions = false
            case 1: showSharedOptions = true
            case 2: showSharedOptions = false
            default: showSharedOptions = false
        }
    }

    @objc func searchArticles(_ sender: AnyObject?) {
        var params: APIParams = APIParams(articleType: articleTypes[articleTypeSegmentedControl.selectedSegmentIndex], lastDaysType: lastDaysTypes[lastDaysSegmentedControl.selectedSegmentIndex])

        if articleTypeSegmentedControl.selectedSegmentIndex == 1 {
            params = APIParams(articleType: articleTypes[articleTypeSegmentedControl.selectedSegmentIndex], lastDaysType: lastDaysTypes[lastDaysSegmentedControl.selectedSegmentIndex], sharedFacebook: sharedFacebookSwitch.isOn, sharedTwitter: sharedTwitterSwitch.isOn)
        }

        self.viewModel.loadArticles(params: params)
    }
}
