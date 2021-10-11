//
//  ViewController.swift
//  Destini
//
//  Created by niBVL on 11/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func choiceOnTap(_ sender: UIButton) {
        storyBrain.updateStory(choice: sender.title(for: .normal)!)
        updateUI()
    }
    
    func updateUI()  {
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
        
    }
        
    
    
}

