//
//  ViewController.swift
//  Xylophone
//
//  Created by niBVL on 29/09/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyOnTap(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            UIView.animate(withDuration: 0.2, animations: {
                sender.alpha = 1.0
            })
        })
    }
    
    func playSound(soundName: String?) {
        let url = Bundle.main.url(forResource: soundName, withExtension: ".wav")!
        player = AVPlayer.init(url: url)
        player?.play()
        
    }
    
}

