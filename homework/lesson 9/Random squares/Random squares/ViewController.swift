//
//  ViewController.swift
//  Random squares
//
//  Created by Alexandr on 5.04.25.
//

import UIKit

class ViewController: UIViewController {

    private let squareSize: CGFloat = 100
    private var squares: [UIView] = []
    private var fillButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeButton()
        // Do any additional setup after loading the view.
    }

    
    private func placeButton() {
        fillButton = UIButton(type: .system)
        fillButton.frame = CGRect(
            x: (view.bounds.width - 100) / 2,
            y: view.bounds.height - 220,
            width: 120,
            height: 60
        )
        fillButton.layer.cornerRadius = 10
        fillButton.setTitle("Fill-up", for: .normal)
        fillButton.setTitleColor(.white, for: .normal)
        fillButton.backgroundColor = .gray
        fillButton.addTarget(self, action: #selector(fillScreen), for: .touchUpInside)
        view.addSubview(fillButton)
    }
    
    @objc private func fillScreen() {
 
        
        let screenWidth = view.bounds.width
        let screenHeight = view.bounds.height
        let columns = Int(screenWidth / squareSize)
        let rows = Int(screenHeight / squareSize)
        
        for row in 0..<rows {
            for column in 0..<columns {
                let square = UIView(frame: CGRect(
                    x: CGFloat(column) * squareSize,
                    y: CGFloat(row) * squareSize,
                    width: squareSize,
                    height: squareSize
                ))
                    square.backgroundColor = randomColor()
                    view.addSubview(square)
                    squares.append(square)
                }
            }
            
        view.bringSubviewToFront(fillButton)
    }
    
    private func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
