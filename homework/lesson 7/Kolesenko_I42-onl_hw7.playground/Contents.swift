import Cocoa

import UIKit

class Shape {
    let color: String
    
    init(color: String) {
        self.color = color
    }
    
    func calculateArea()  -> Double {
        return Double.nan
    }
}


class Circle: Shape {
    let radius: Double
    
    init(radius: Double, color: String) {
        self.radius = radius
        super.init(color: color)
    }
    
    override func calculateArea()  -> Double {
        return Double.pi * radius * radius
    }
}

class Rectangle: Shape {
    let length: Double
    let width: Double
    
    init(length: Double, width: Double, color: String) {
        self.length = length
        self.width = width
        super.init(color: color)
    }
    
    override func calculateArea()  -> Double {
        return length * width
    }
    
}

class Triangle: Shape {
    
    
    let base: Double
    let height: Double
    
    init(color: String, base: Double, height: Double) {
        self.base = base
        self.height = height
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return 0.5 * base * height
    }
    
}



let circle = Circle(radius: 5.1, color: "red")
circle.calculateArea()
let rectangle = Rectangle(length: 4.0, width: 6.2, color: "blue" )
rectangle.calculateArea()
let triangle = Triangle(color: "blue", base: 10, height: 20)
triangle.calculateArea()

struct Contact {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String?
}

let contacts : [Contact] = [
    (Contact(firstName: "John", lastName: "Wane", phoneNumber: "+275123456789", email: "jo15@yahoo.com")),
    (Contact(firstName: "Jane", lastName: "Doe", phoneNumber: "+278765432109", email: "jane@example.com")),
    (Contact(firstName: "Michael", lastName: "Smith", phoneNumber: "+279876543210", email: nil)),
    (Contact(firstName: "Steve", lastName: "Johnson", phoneNumber: "+277123355678", email: "sweetcheeks@example.com"))
]

func lookUpName(contacts: [Contact], keyphrase: String) -> [Contact] {
    return contacts.filter {
        $0.firstName.lowercased().contains(keyphrase) ||  $0.lastName.lowercased().contains(keyphrase)
    }
}

lookUpName(contacts: contacts, keyphrase: "john")

