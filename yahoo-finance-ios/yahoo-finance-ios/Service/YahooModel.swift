//
//  YahooModel.swift
//  yahoo-finance-ios
//
//  Created by MATHEUS DE ASSIS CARVALHO on 07/02/22.
//

import Foundation

public struct YahooModel: Decodable {
    let quoteResponse: QuoteResponse
}

public struct QuoteResponse: Decodable {
    let result: [Result]
}

public struct Result: Decodable {
    let bid: Decimal
    let ask: Decimal
    let currency: String
    let displayName: String
}
