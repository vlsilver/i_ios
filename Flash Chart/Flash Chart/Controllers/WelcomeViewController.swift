//
//  WelcomeViewController.swift
//  Flash Chart
//
//  Created by niBVL on 14/10/2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleText = K.appName
        var letterIndex = 0.0
        titleLabel.text = ""
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1*letterIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            letterIndex += 1
        }
        
    }
    
    
}
