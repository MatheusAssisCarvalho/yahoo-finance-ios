//
//  ViewController.swift
//  yahoo-finance-ios
//
//  Created by PEDRO GALDIANO DE CASTRO on 07/02/22.
//

import UIKit

class ViewController: UIViewController {

    var yahooService = YahooService()

    var results: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        yahooService.delegate = self

        yahooService.getQuoteOf()
        view.backgroundColor = .systemBlue
    }

}

extension ViewController: YahooServiceDelegate {
    func didGetQuote(_ yahooService: YahooService, data: YahooModel) {
        DispatchQueue.main.async {

            self.results = data.quoteResponse.result
            print("aqui")
            print(self.results)

        }
    }
}
