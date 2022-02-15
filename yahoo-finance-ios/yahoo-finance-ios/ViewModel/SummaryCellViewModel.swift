//
//  SummaryCellViewModel.swift
//  yahoo-finance-ios
//
//  Created by MATHEUS DE ASSIS CARVALHO on 15/02/22.
//

import UIKit

class SummaryCellViewModel: UIViewController {

    var yahooService = YahooService()
    var results: [Result] = []

}

extension SummaryCellViewModel: YahooServiceDelegate {
    func didGetQuote(_ yahooService: YahooService, data: YahooModel) {
        DispatchQueue.main.async {

            self.results = data.quoteResponse.result
            print("aqui")
            print(self.results)

        }
    }

}
