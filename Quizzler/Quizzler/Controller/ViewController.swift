//
//  ViewController.swift
//  Quizzler
//
//  Created by niBVL on 06/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var quizzBrainModel = QuizzBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUI()
    }
    
    func initialUI() {
        scoreLabel.text = quizzBrainModel.getCurrentScore()
        questionLabel.text = quizzBrainModel.getCurrentQuestion()
        progressBar.progress = quizzBrainModel.getCurrentProgress()
        choice1Button.setTitle(quizzBrainModel.getCurrentAnswer1(), for: .normal)
        choice2Button.setTitle(quizzBrainModel.getCurrentAnswer2(), for: .normal)
        choice3Button.setTitle(quizzBrainModel.getCurrentAnswer3(), for: .normal)
    }
    
    @IBAction func answerOnTap(_ sender: UIButton) {
        let userAnswer = quizzBrainModel.checkUserAnswer(answerOfUser: sender.currentTitle!)
        if userAnswer {
            sender.backgroundColor = UIColor.green
            scoreLabel.text = quizzBrainModel.getCurrentScore()
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: self, repeats: false)
        
    }
    
    @objc func  updateUI()  {
         choice1Button.backgroundColor = UIColor.clear
         choice2Button.backgroundColor = UIColor.clear
         choice3Button.backgroundColor = UIColor.clear
         choice1Button.setTitle(quizzBrainModel.getCurrentAnswer1(), for: .normal)
         choice2Button.setTitle(quizzBrainModel.getCurrentAnswer2(), for: .normal)
         choice3Button.setTitle(quizzBrainModel.getCurrentAnswer3(), for: .normal)
         progressBar.progress = quizzBrainModel.getCurrentProgress()
         questionLabel.text = quizzBrainModel.getCurrentQuestion()
         
     }

}

