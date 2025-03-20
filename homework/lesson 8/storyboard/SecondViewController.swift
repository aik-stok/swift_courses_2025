//
//  SecondViewController.swift
//  storyboard


import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValue(slider)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderValue(_ sender: UISlider) {
        label.text = "\(String(Int(slider.value))) C°"

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
