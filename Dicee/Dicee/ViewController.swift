//
//  ViewController.swift
//  Dicee
//
//  Created by niBVL on 27/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOlet allows me to reference a UI Element
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    let listDice = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        diceImageView1.image = listDice[Int.random(in: 1...5)]
        diceImageView2.image = listDice[Int.random(in: 1...5)]
        print("Button got tapped.")
    }
    
}




