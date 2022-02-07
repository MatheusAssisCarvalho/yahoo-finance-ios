//
//  YahooService.swift
//  yahoo-finance-ios
//
//  Created by MATHEUS DE ASSIS CARVALHO on 07/02/22.
//

import Foundation

public final class YahooService {

    public enum ResultHttp<T> {
        case success(resultHttp: T)
        case error(message: String?)
    }

    public func searchRepositories (query: String = "AAPL") {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "yfapi.net"
        components.path = "/v6/finance/quote"
        components.queryItems = [
            URLQueryItem(name: "region", value: "US"),
            URLQueryItem(name: "lang", value: "en"),
            URLQueryItem(name: "symbols", value: query)
        ]

        guard let url = components.url else { return }
        print(url)

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "x-api-key": "16JFPMzREMagATHd3iCLD45kxqvrf8O592EgeM0A"
        ]

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        self.request(request: request)
    }

    private func request(request: URLRequest) {

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(YahooModel.self, from: data)
                print(response.quoteResponse.result[0])
            } catch {
                print(error)
                return
            }
        }
        task.resume()
    }

}
