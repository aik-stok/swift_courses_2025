//
//  ViewController.swift
//  Circle control
//
//  Created by Alexandr on 3.04.25.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var circleView: UIView!
    private let circleSize: CGFloat = 50.0
    
    private var upButton: UIButton!
    private var downButton: UIButton!
    private var leftButton: UIButton!
    private var rightButton: UIButton!
    private let buttonSize: CGFloat = 50.0
    private let step: CGFloat = 25
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleView = UIView(frame: CGRect(x: (view.bounds.width - circleSize) / 2, y: (view.bounds.height - circleSize) / 2, width: circleSize, height: circleSize))
        circleView.backgroundColor = .blue
        circleView.layer.cornerRadius = circleSize / 2
        view.addSubview(circleView)
        placeButtons()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    private func placeButtons() {
        let buttonOffset: CGFloat = 20.0
        
        // UB
        upButton = UIButton(frame: CGRect(
            x: (view.bounds.width - buttonSize) / 2,
            y: 50,
            width: buttonSize,
            height: buttonSize
        ))
        upButton.layer.cornerRadius = 10
        upButton.setTitle("⬆️", for: .normal)
        upButton.backgroundColor = .lightGray
        upButton.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
        view.addSubview(upButton)
        
        // DB
        downButton = UIButton(frame: CGRect(
            x: (view.bounds.width - buttonSize) / 2,
            y: view.bounds.height - buttonSize - buttonOffset,
            width: buttonSize,
            height: buttonSize
        ))
        downButton.layer.cornerRadius = 10
        downButton.setTitle("⬇️", for: .normal)
        downButton.backgroundColor = .lightGray
        downButton.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
        view.addSubview(downButton)
        
        // LB
        leftButton = UIButton(frame: CGRect(
            x: buttonOffset,
            y: view.bounds.height - buttonSize - buttonOffset ,
            width: buttonSize,
            height: buttonSize
        ))
        leftButton.layer.cornerRadius = 10
        leftButton.setTitle("⬅️", for: .normal)
        leftButton.backgroundColor = .lightGray
        leftButton.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)
        view.addSubview(leftButton)
        
        //RB
        rightButton = UIButton(frame: CGRect(
            x: view.bounds.width - buttonSize - buttonOffset,
            y: view.bounds.height - buttonSize - buttonOffset,
            width: buttonSize,
            height: buttonSize
        ))
        rightButton.layer.cornerRadius = 10
        rightButton.setTitle("➡️", for: .normal)
        rightButton.backgroundColor = .lightGray
        rightButton.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
        view.addSubview(rightButton)
    }
    
    
    
    
    // go up
    @objc private func moveUp() {
        let newY = max(circleView.frame.origin.y - step, 0)
        if newY > upButton.frame.maxY {
            UIView.animate(withDuration: 0.2) {
                self.circleView.frame.origin = CGPoint(x: self.circleView.frame.origin.x, y: newY)
            }
        }
    }
    
    // go down
    @objc private func moveDown() {
        let newY = min(circleView.frame.origin.y + step, view.bounds.height - circleSize)
        if newY + circleSize < downButton.frame.origin.y {
            UIView.animate(withDuration: 0.2) {
                self.circleView.frame.origin = CGPoint(x: self.circleView.frame.origin.x, y: newY)
            }
        }
    }
    
    // go left
    @objc private func moveLeft() {
        let newX = max(circleView.frame.origin.x - step, 0)
        UIView.animate(withDuration: 0.2) {
            self.circleView.frame.origin = CGPoint(x: newX, y: self.circleView.frame.origin.y)
        }
    }
    
    // go right
    @objc private func moveRight() {
        let newX = min(circleView.frame.origin.x + step, view.bounds.width - circleSize)
        UIView.animate(withDuration: 0.2) {
            self.circleView.frame.origin = CGPoint(x: newX, y: self.circleView.frame.origin.y)
        }
    }
}

