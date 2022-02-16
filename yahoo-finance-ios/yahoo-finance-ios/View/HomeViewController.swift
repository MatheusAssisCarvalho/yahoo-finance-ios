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
        yahooService.delegate = self
        yahooService.getQuoteOf()

        let nibCellSummary = UINib(nibName: "SummaryCell", bundle: nil)
        tableView.register(nibCellSummary, forCellReuseIdentifier: "MySummaryCell")
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "MySummaryCell") as? SummaryCell
        let currency = self.results[indexPath.row].currency

        let numFormat = NumberFormatter()
        numFormat.numberStyle = .decimal
        numFormat.minimumFractionDigits = 2
        numFormat.locale = Locale(identifier: "pt_BR")

        cell?.name.text = self.results[indexPath.row].displayName

        let venda = numFormat.string(from: NSNumber(value: self.results[indexPath.row].ask))!
        cell?.venda.text = "\(currency) \(venda)"

        let compra = numFormat.string(from: NSNumber(value: self.results[indexPath.row].bid))!
        cell?.compra.text = "\(currency) \(compra)"

        return cell!
    }
}

extension HomeViewController: YahooServiceDelegate {
    func didGetQuote(_ yahooService: YahooService, data: YahooModel) {
        DispatchQueue.main.async {
            self.results = data.quoteResponse.result
            self.tableView.reloadData()
        }
    }
}
