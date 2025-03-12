import UIKit
import Foundation

struct ExchangeRateResponse: Codable {
    let rates: [String: Double]
}

func request() async throws -> ExchangeRateResponse {
    let urlString = "https://api.exchangerate-api.com/v4/latest/USD"
    guard let url = URL(string: urlString) else {
        throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    return try decoder.decode(ExchangeRateResponse.self, from: data)
}



enum Currency: String {
    case usd = "USD"
    case eur = "EUR"
    case byn = "BYN"
}

func getExchangeRate(from: Currency, to: Currency) -> Double? {
    var rates = Task {
        do {
            let result = try await request()
            var rates = ["USD" : 1, "BYN": 3.17, "EUR": 0.90]
            
            rates["USD"] = result.rates["USD"] ?? 0
            rates["EUR"] = result.rates["EUR"] ?? 0
            rates["BYN"] = result.rates["BYN"] ?? 0
            if from == .usd {
                return rates[to.rawValue]
            }
            else if to == .usd {
                guard let fromRate = rates[from.rawValue] else { return nil }
                return 1.0 / fromRate
            }
            else {
                guard let fromRate = rates[from.rawValue],
                      let toRate = rates[to.rawValue] else { return nil }
                return toRate / fromRate
            }
            
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    print(rates)
    return rates.value
    // без асинхронных функций запрос не отправить, а если уж утправил, то потом данные не достать. Маразм!!! 🤯
}



