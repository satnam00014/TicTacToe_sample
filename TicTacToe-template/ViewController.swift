//
//  ViewController.swift
//  TicTacToe-template
//
//  Created by Mohammad Kiani on 2020-06-08.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var x1: UIButton!
    @IBOutlet weak var x2: UIButton!
    @IBOutlet weak var x3: UIButton!
    @IBOutlet weak var x4: UIButton!
    @IBOutlet weak var x5: UIButton!
    @IBOutlet weak var x6: UIButton!
    @IBOutlet weak var x7: UIButton!
    @IBOutlet weak var x8: UIButton!
    @IBOutlet weak var x9: UIButton!
    
    
    var isFirstPlayer = true
    var buttonTags :[Int] = []
    var values = ["1","2","3","4","5","6","7","8","9"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func playerInput(_ sender: UIButton) {
        let tag = sender.tag
        
        if buttonTags.contains(tag){
            return
        }else{
            buttonTags.append(tag)
            sender.setTitleColor(UIColor.black, for: .normal)
        }
        if isFirstPlayer {
            values[tag-1] = "0"
            if isFinished(){
                reset()
                outputLabel.text = "First wins"
                return
            }
            isFirstPlayer = false
            sender.setTitle("0", for: .normal)
        }else{
            values[tag-1] = "X"
            if isFinished(){
                reset()
                outputLabel.text = "Second wins"
                return
            }
            isFirstPlayer = true
            sender.setTitle("X", for: .normal)
        }
        if buttonTags.count == 9 {
            reset()
            outputLabel.text = "no winner"
            return
        }
    }
    
    func isFinished()->Bool{
        //for horizontal equality
        if values[0] == values[1] && values[1] == values[2]{
            return true
        }else if values[3] == values[4] && values[4] == values[5]{
            return true
        }else if values[6] == values[7] && values[7] == values[8]{
            return true
            
            //for vertical equality
        }else if values[0] == values[3] && values[3] == values[6]{
            return true
        }else if values[1] == values[4] && values[4] == values[7]{
            return true
        }else if values[2] == values[5] && values[5] == values[8]{
            return true
            
            //cross equality
        }else if values[0] == values[4] && values[4] == values[8]{
            return true
        }else if values[2] == values[4] && values[4] == values[6]{
            return true
        }
        return false
    }
    
    func reset(){
        isFirstPlayer = true
        for i in 0...8{
            values[i] = "\(i+1)"
        }
        x1.setTitleColor(UIColor.white, for: .normal)
        x2.setTitleColor(UIColor.white, for: .normal)
        x3.setTitleColor(UIColor.white, for: .normal)
        x4.setTitleColor(UIColor.white, for: .normal)
        x5.setTitleColor(UIColor.white, for: .normal)
        x6.setTitleColor(UIColor.white, for: .normal)
        x7.setTitleColor(UIColor.white, for: .normal)
        x8.setTitleColor(UIColor.white, for: .normal)
        x9.setTitleColor(UIColor.white, for: .normal)
        buttonTags = []
        
    }
    

}

