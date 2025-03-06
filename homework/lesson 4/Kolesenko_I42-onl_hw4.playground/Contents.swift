import UIKit

// 1 print person name or " Hello World"

func printHi(_ person: String = "" ) {
    guard person.isEmpty else {
        return print("Hello, \(person)!")
    }
    return print("Hello, World!")
}

printHi("Misha")

// 2 return sum of chars

func sumOfCharacters(_ string1: String,_ string2: String) -> Int {
    let sum1 = string1.count
    let sum2 = string2.count
    return sum1 + sum2
}
sumOfCharacters ("Misha", "Afanasij")

// 3 function that prints squre from input number

func squreFrom (_ number: Int) {
    return print("\(number * number)")
}
print(squreFrom(8))


//4 function that calculates area of circle through radius

func areaOfCircle (_ radius: Double) {
  3.14 * radius * radius
}
print(areaOfCircle(3))

// 5 return day or night string

let hour = Calendar.current.component(.hour, from: Date())

func timeOfDay (_ hour: Int) -> String {
    hour > 6 ? "It's day" : "It's night"
}

print(timeOfDay(hour))

// 6 function returns season of the year

func seasonOfYear(_ month: Int) -> String {
    
    switch month {
    case 12, 1, 2:
        return "Winter"
    case 3, 4, 5:
        return "Spring"
    case 6, 7, 8:
        return "Summer"
    case 9, 10, 11:
        return "Autumn"
    default:
        break
    }
    return "Input adequate number"
}
seasonOfYear(5)

// 7 Phone number stripping

func stripNum (_ phonenumber: String = "") -> String {
    var newString = ""
    newString += phonenumber.prefix(4) + " ("
    newString += phonenumber.prefix(6).dropFirst(4) + ") "
    newString += phonenumber.suffix(7)
    return newString
}
stripNum("+375293267777")

// 8 prime number function

func FindPrime(_ number: Int) -> Bool {
    guard number >= 2 else { return false }
    guard number <= 100 else { return false }
    
    for i in 2 ..< number {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

FindPrime(89)



// 9 function returns factorial

func factorialValue(_ number: Int) {
    var result = 1
    
    if (number > 1) {
        for i in 1...number{
            result *= i
        }
    }
    return print("\(result)")
}
factorialValue(5)

// 10 Fibonnachi

func fibo( num: Int) {
   var a = 0, b = 1
    var result = ""
    for i in 0..<num {
        (a, b) = (b, a + b)
        result += "\(a) "
    }
}

fibo(num: 10)

// 11 Summation on each single digit

func summation(_ num: Int) -> Int {
  var sum = 0
  num.description.forEach { sum += Int(String($0)) ?? 0 }
  return sum
}

summation(6781)
