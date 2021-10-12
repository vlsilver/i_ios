//
//  ViewController.swift
//  Tipsy
//
//  Created by niBVL on 11/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tipBrain = TipBrain()
        
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipButton0: UIButton!
    @IBOutlet weak var tipButton10: UIButton!
    @IBOutlet weak var tipButton20: UIButton!
    @IBOutlet weak var splitStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitLabel.text = String(format: "%.0f",splitStepper.value )
        // Do any additional setup after loading the view.
    }

    @IBAction func billInputChanged(_ sender: UITextField) {
        tipBrain.setBillValue(bill: sender.text ?? "0.0")
    }
    
    @IBAction func tipButtonOnTap(_ sender: UIButton) {
     
        if (tipButton0.isSelected) {
            tipButton0.isSelected = false
        }
        if (tipButton10.isSelected) {
            tipButton10.isSelected = false
        }
        if (tipButton20.isSelected) {
            tipButton20.isSelected = false
        }
        sender.isSelected = true
        tipBrain.setTipValue(tipString: sender.currentTitle!)
    }
    
    @IBAction func splitStepperOnTap(_ sender: UIStepper) {
        tipBrain.setSplitValue(splitValue: Float(sender.value))
        splitLabel.text = tipBrain.getSplitText()
    }
    
    @IBAction func calculateOnTap(_ sender: UIButton) {
        tipBrain.calculatorTip()
        self.performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let targetVC = segue.destination as! ResultViewController
            targetVC.tipBrain = tipBrain
        }
    }
    
}

