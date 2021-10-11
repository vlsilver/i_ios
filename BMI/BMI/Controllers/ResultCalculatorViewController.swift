//
//  ResultCalculatorViewController.swift
//  BMI
//
//  Created by niBVL on 11/10/2021.
//

import UIKit

class ResultCalculatorViewController: UIViewController {

    var bmiResult: CalculatorBrain?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(bmiResult!)
        self.view.backgroundColor = bmiResult?.getColor()
        bmiLabel.text = bmiResult?.getBmiValue()
        adviseLabel.text =  bmiResult?.getAdvise()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reCalculatorOnTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    



}
