//
//  ViewController.swift
//  yahoo-finance-ios
//
//  Created by PEDRO GALDIANO DE CASTRO on 07/02/22.
//

import UIKit

class ViewController: UIViewController {

    var yahooService = YahooService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        yahooService.searchRepositories()
        view.backgroundColor = .systemBlue
    }

}
