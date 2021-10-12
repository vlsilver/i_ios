//
//  ResultViewController.swift
//  Tipsy
//
//  Created by niBVL on 12/10/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var tipBrain: TipBrain?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = tipBrain?.getCalculator()
        descLabel.text = tipBrain?.getTipText()
    }
    
    @IBAction func reCalculateOnTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
