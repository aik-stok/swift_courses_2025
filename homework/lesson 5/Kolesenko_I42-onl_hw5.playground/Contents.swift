import UIKit

enum Currency: String {
    case usd = "USD"
    case eur = "EUR"
    case byn = "BYN"
}

func getExchangeRate(from: Currency, to: Currency) -> Double? {
    var rates = ["USD" : 1, "BYN": 3.18, "EUR": 0.92]
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
}

getExchangeRate(from: .eur, to: .byn)
getExchangeRate(from: .byn, to: .usd)
getExchangeRate(from: .eur, to: .usd)
getExchangeRate(from: .usd, to: .eur)

func convertCurrency(amount: Double, from: Currency, to: Currency) -> Double? {
  guard let sum = getExchangeRate(from: from, to: to)  else { return nil }
                     return sum * amount
}

convertCurrency(amount: 5, from: .eur, to: .byn)
convertCurrency(amount: 5, from: .byn, to: .usd)
convertCurrency(amount: 5, from: .eur, to: .usd)
convertCurrency(amount: 5, from: .usd, to: .eur)

enum Grade: Int {
    case A = 90
    case B = 80
    case C = 60
    case D = 30
    case F = 10
    
    var description : String {
      switch self {
        case .A: return "A"
        case .B: return "B"
        case .C: return "C"
        case .D: return "D"
        case .F: return "F"
      }
    }
}

Grade(rawValue: 90)
func getLetterGrade(score: Int) -> Grade? {

    switch score {
    case 90...:
        return Grade(rawValue: 90)
    case 80..<90:
        return Grade(rawValue: 80)
    case 60..<80:
        return Grade(rawValue: 60)
    case 30..<60:
        return Grade(rawValue: 30)
    case 10..<30:
        return Grade(rawValue: 10)
    default:
        return nil
    }
}


            
getLetterGrade(score: 82)

func printExamResult(name: String, score: Int) -> String {
    guard let grade = getLetterGrade(score: score) else { return "\(name) got unexepatable score: \(score)" }
        return "\(name) scored \(score). It is  \(grade)"
}

printExamResult(name: "Max", score: 105)
printExamResult(name: "Max", score: 80)
printExamResult(name: "Max", score: 52)
printExamResult(name: "Max", score: 5)
