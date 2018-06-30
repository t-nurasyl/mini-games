//
//  FirstViewController.swift
//  Games
//
//  Created by Нурасыл on 29.06.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, ViewControllerDelegate {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var easyBtn: UIButton!
    @IBOutlet weak var middleBtn: UIButton!
    @IBOutlet weak var hardBtn: UIButton!
    
    var number1 = 0
    var number2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            
            if let dvc = segue.destination as? PlayViewController {
                dvc.delegate = self
                dvc.x = number1
                dvc.y = number2
            }
            
        }
    }
    
    func setText(text: String, text2: String) {
        self.userLabel.text = text
        self.scoreLabel.text = text2 
    }
    
    
    @IBAction func changeLevel(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            number1 = Int(arc4random_uniform(9) + 1)
            number2 = Int(arc4random_uniform(9) + 1)
        case 1:
            number1 = Int(arc4random_uniform(99) + 1)
            number2 = Int(arc4random_uniform(99) + 1)
        case 2:
            number1 = Int(arc4random_uniform(999) + 1)
            number2 = Int(arc4random_uniform(999) + 1)
        default:
            break
        }
    }

}
