//
//  SecondViewController.swift
//  Games
//
//  Created by Нурасыл on 29.06.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var viewshka: UIView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    
    var colors : [Colors] = [Colors(name: "white", color: UIColor.white),
                             Colors(name: "green", color: UIColor.green),
                             Colors(name: "blue", color: UIColor.blue),
                             Colors(name: "yellow", color: UIColor.yellow),
                             Colors(name: "red", color: UIColor.red),
                             Colors(name: "black", color: UIColor.black)]
    
    var boo = false
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text! = String(count)
        change()
        setTitle()
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        if(count != 0){
        switch sender.currentTitle {
        case "False":
            if(viewshka.backgroundColor != colorLabel.textColor){
                count += 1
                change()
            }else{
                change()
                count -= 1
            }
            countLabel.text = String(count)
        case "True":
            if(viewshka.backgroundColor == colorLabel.textColor){
                count += 1
                change()
            }else{
                change()
                count -= 1
            }
            countLabel.text = String(count)
        default:
            break
            }
        
        }else{
            let alertController = UIAlertController(title: "GAME OVER!", message: "", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    //MARK: Random
    func random(){
        let index: Int = Int(arc4random_uniform(UInt32(colors.count)))
        let key = Array(colors)[index].getColor
        
        viewshka.backgroundColor = key
    }
    
    func randomLabel(){
        let index: Int = Int(arc4random_uniform(UInt32(colors.count)))
        let keys = Array(colors)[index].getName
        
        colorLabel.text = keys
    }
    
    func randomColor(){
        let index: Int = Int(arc4random_uniform(UInt32(colors.count)))
        let keyler = Array(colors)[index].getColor

        colorLabel.textColor = keyler
    }
    
    func change(){
        random()
        randomLabel()
        randomColor()
    }
    
    func setTitle(){
        falseBtn.setTitle("False", for: .normal)
        trueBtn.setTitle("True", for: .normal)
    }
}
