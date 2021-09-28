//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by niBVL on 28/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageBall: UIImageView!
    let listBallImage = [#imageLiteral(resourceName: "ball2"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball5")]
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBall.image = #imageLiteral(resourceName: "ball1")
        
    }


    @IBAction func askButtonOnTap(_ sender: UIButton) {
        imageBall.image = listBallImage[Int.random(in: 0...3)]
    }
    
    
    

}

