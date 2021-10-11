//
//  ViewController.swift
//  BMI
//
//  Created by niBVL on 11/10/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSliderUI: UISlider!
    @IBOutlet weak var weightSilderUI: UISlider!
    
    
    var calculatorBrain = CalculatorBrain()
    var height: Float = 1.5
    var weight: Float = 50
    
    override func viewDidLoad() {
        heightLabel.text = "\(height)m"
        weightLabel.text = "\(weight)kg"
        heightSliderUI.setValue(height, animated: false)
        weightSilderUI.setValue(weight, animated: false)
        super.viewDidLoad()
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        height =  sender.value
        heightLabel.text = String(format: "%.1f", height) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weight = sender.value
        weightLabel.text = String(format: "%.0f", weight) + "kg"
        
    }
    
    
    @IBAction func calculatorBMI(_ sender: UIButton) {
        calculatorBrain.calculatorBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "resultCalculator", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultCalculator" {
            let destinationVC = segue.destination as! ResultCalculatorViewController
            destinationVC.bmiResult = calculatorBrain
        }
        
    }
}

