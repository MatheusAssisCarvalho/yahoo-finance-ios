//
//  HomeViewController.swift
//  yahoo-finance-ios
//
//  Created by PEDRO GALDIANO DE CASTRO on 07/02/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var yahooService = YahooService()
    var results: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        yahooService.delegate = self
//        yahooService.getQuoteOf()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
//        let myCell = cells[row]

        var cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        cell.contentView = myCell
        return cell
    }

}

extension HomeViewController: YahooServiceDelegate {
    func didGetQuote(_ yahooService: YahooService, data: YahooModel) {
        DispatchQueue.main.async {

            self.results = data.quoteResponse.result
            print("aqui")
            print(self.results)

        }
    }

}
