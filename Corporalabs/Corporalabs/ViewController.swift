//
//  ViewController.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 29/12/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var articleTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var lastDaysSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sharedFacebook: UISwitch!
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    func configureView() {
        self.sharedFacebook.isOn = false
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

        sharedAPIManager.fetchFilms(params: params) { (result, articles) in
           switch result {
               case .success: print(articles?[0].title)
               case .error: print("Error")
           }
        }
    }
}
