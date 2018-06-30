//
//  PlayViewController.swift
//  Games
//
//  Created by Нурасыл on 29.06.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func setText(text: String, text2: String)
}

class PlayViewController: UIViewController {
    
    @IBOutlet weak var typeTxtField: UITextField!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var problemLabel: UILabel!
    
    weak var delegate: ViewControllerDelegate?
    
    var x = 0
    var y = 0
    var number = 0
    var count = 0
    
    var timer = Timer()
    var seconds = 20
    var isTimerRunning = false
    
    var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(moveQuestionLabel), userInfo: nil, repeats: true)
        runTimer()
        newQuestion()
    }
    
    @IBAction func submitBtn(_ sender: UIButton) {
        if typeTxtField.text! == String(x*y){
            count += 1
        }else{
            count -= 1
        }
        scoreLabel.text! = String(count)
        newQuestion()
    }
    
    @objc func moveQuestionLabel() {
        if(problemLabel.center.y >= bottomView.center.y) {
            newQuestion()
        }
        UIView.animate(withDuration: 0.2) {
            self.problemLabel.center.y += CGFloat(5)
        }
        
    }
    
    //MARK: Generate new random question
    func newQuestion() {
        problemLabel.text = "\(x) x \(y) ="
        problemLabel.center.y = 50
    }
    
    //MARK: Timer
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(PlayViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate "time's up!"
            let alertController = UIAlertController(title: "GAME OVER!", message: "", preferredStyle: .alert)
            let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
                // Get 1st TextField's text
                self.textField = alertController.textFields![0]
                self.delegate?.setText(text: self.textField.text!, text2: self.scoreLabel.text!)
                self.navigationController?.popViewController(animated: true)
                print(self.textField.text!)
            })
            // Add 1 textField and customize it
            alertController.addTextField { (textField: UITextField) in
                textField.keyboardAppearance = .dark
                textField.keyboardType = .default
                textField.autocorrectionType = .default
                textField.placeholder = "Type your name ..."
                textField.clearButtonMode = .whileEditing
            }
            
            alertController.addAction(submitAction)
            self.present(alertController, animated: true, completion: nil)
            

        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func timeString(time:TimeInterval) -> String {
//        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }

}
