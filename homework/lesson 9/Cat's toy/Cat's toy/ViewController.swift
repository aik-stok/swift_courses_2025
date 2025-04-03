//
//  ViewController.swift
//  Cat's toy
//
//  Created by Alexandr on 31.03.25.
//

import UIKit

class ViewController: UIViewController {
    
    private var circleView: UIView!
    private let circleSize: CGFloat = 60.0

    override func viewDidLoad() {
        super.viewDidLoad()
        circleView = UIView(frame: CGRect(x: 0, y: 0, width: circleSize, height: circleSize))
        circleView.layer.cornerRadius = circleSize / 2
        circleView.backgroundColor = randomiseColor()
        view.addSubview(circleView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGesture)
        randomPopUp()
        
        // Do any additional setup after loading the view.
    }
    
    private func randomPopUp() {
        let screenWidth = view.bounds.width
        let screenHeight = view.bounds.height
        
        let boundWidth = screenWidth - (circleSize + 5)
        let boundHeight = screenHeight - (circleSize + 5)
        
        let randomX = CGFloat.random(in: 5...boundWidth)
        let randomY = CGFloat.random(in: 50...boundHeight)
        
        UIView.animate(withDuration: 0.2) {
            self.circleView.frame.origin = CGPoint(x: randomX, y: randomY)
        }
    }
    
    private func randomiseColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    

    
    @objc private func tap(_ gesture: UITapGestureRecognizer) {
        let locationOnscreen = gesture.location(in: view)
        if circleView.frame.contains(locationOnscreen) {
            circleView.backgroundColor = randomiseColor()
            randomPopUp()
        }
    }
}
