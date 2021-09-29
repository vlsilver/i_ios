//
//  ViewController.swift
//  Egg Time
//
//  Created by niBVL on 29/09/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let hardnessData: [String:Int] = ["Soft": 3, "Medium": 4 , "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var timeEgg = 0
    @IBOutlet weak var statusView: UILabel!
    @IBOutlet weak var progressView: UIProgressView!

    @IBAction func hardnessEggOnTap(_ sender: UIButton) {
        timer.invalidate()
        timeEgg = 0
        progressView.progress = 0
        totalTime = hardnessData[sender.currentTitle!]!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleEggTimer), userInfo: nil, repeats: true)

    }
    @objc func handleEggTimer() {
        
        if timeEgg < totalTime {
            timeEgg += 1
            statusView.text = "\(timeEgg) seconds"
            progressView.progress = Float(timeEgg)/Float(totalTime)
        }
        else {
            statusView.text = "Done"
            timer.invalidate()
        }
    }

    
}

