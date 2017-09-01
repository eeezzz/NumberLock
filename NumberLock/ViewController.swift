//
//  ViewController.swift
//  NumberLock
//
//  Created by giming on 2017/9/1.
//  Copyright © 2017年 hsin-yi. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    // make a random number
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false {
            //playing a game
            print(answer)
            
            // take input text out
            let inputText = inputTextField.text!
            // clear textfield
            inputTextField.text = ""
            let inputNumber = Int(inputText)
            if inputNumber == nil {
                // wrong input
                messageLabel.text = "沒有輸入哦! 猜一個數字 \(minNumber) ~ \(maxNumber)"
                print("wrong input")
            }else{
                // input ok
                if inputNumber! > 100 {
                    // user input too large
                    messageLabel.text = "太大! 猜一個數字 \(minNumber) ~ \(maxNumber)"
                    print("to large")
                }else if inputNumber! < 1 {
                    // user input too small
                    messageLabel.text = "太小! 猜一個數字 \(minNumber) ~ \(maxNumber)"
                    print("too small")
                }else if inputNumber == answer {
                    // Bingo! right answer
                    messageLabel.text = "猜對啦!, 按 [Guess] 再玩一次!"
                    background.image = UIImage(named: "Finish")
                    isOver = true
                }else {
                    // wrong answer
                    if inputNumber! > answer {
                        maxNumber = inputNumber!
                    }else{
                        // smaller than answer
                        minNumber = inputNumber!
                    }
                    messageLabel.text = "再來一次! 猜一個數字 \(minNumber) ~ \(maxNumber)"
                }
            }
            
        }else{
            // game is over
            isOver = false
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "猜一個數字  \(minNumber) ~ \(maxNumber)"
            background.image = UIImage(named: "BG")
            
            
        }
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // push the keyboard up
        inputTextField.becomeFirstResponder()
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

