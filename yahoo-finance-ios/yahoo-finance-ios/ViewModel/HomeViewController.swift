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

        let nibCellSummary = UINib(nibName: "SummaryCell", bundle: nil)
        tableView.register(nibCellSummary, forCellReuseIdentifier: "MySummaryCell")
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView
                .dequeueReusableCell(withIdentifier: "MySummaryCell") as? SummaryCell
            cell?.label.text = "Hello world."
            return cell!

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
