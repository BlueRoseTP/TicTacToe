//
//  ViewController.swift
//  TicTacToe
//
//  Created by Reagan W. Davenport on 11/15/16.
//  Copyright © 2016 Reagan W. Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    
    var labelsArray = [GridLabel]()
    
    var xTurn = true
    
    var gameOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
    }

    func checkForWinner()
    {
        // check first row; cells 0, 1, and 2.
        if checkLine(one: 0, two: 1, three: 2)
        {
            displayWinningMessage(message: "\(labelsArray[0].text!) is the winner!")
        }
        
        // check second row; cells 3, 4, and 5.
        else if checkLine(one: 3, two: 4, three: 5)
        {
            displayWinningMessage(message: "\(labelsArray[3].text!) is the winner!")
        }
        
        // check third row; cells 6, 7, and 8.
        else if checkLine(one: 6, two: 7, three: 8)
        {
            displayWinningMessage(message: "\(labelsArray[6].text!) is the winner!")
        }
        
        // check first column; cells 0, 3, and 6.
        else if checkLine(one: 0, two: 3, three: 6)
        {
            displayWinningMessage(message: "\(labelsArray[0].text!) is the winner!")
        }
        
        // check second column; cells 1, 4, and 7.
        else if checkLine(one: 1, two: 4, three: 7)
        {
            displayWinningMessage(message: "\(labelsArray[1].text!) is the winner!")
        }
        
        // check third column; cells 2, 5, and 8.
        else if checkLine(one: 2, two: 5, three: 8)
        {
            displayWinningMessage(message: "\(labelsArray[2].text!) is the winner!")
        }
        
        // check downwards diagonal; cells 0, 4, and 8.
        else if checkLine(one: 0, two: 4, three: 8)
        {
            displayWinningMessage(message: "\(labelsArray[0].text!) is the winner!")
        }
        
        // check upwards diagonal; cells 2, 4, and 6.
        else if checkLine(one: 2, two: 4, three: 6)
        {
            displayWinningMessage(message: "\(labelsArray[2].text!) is the winner!")
        }
    }
    
    func checkLine(one : Int, two : Int, three : Int) -> Bool
    {
        if labelsArray[one].text != "" && labelsArray[one].text == labelsArray[two].text && labelsArray[one].text == labelsArray[three].text
        {
            return true
        }
        return false
    }
    
    func displayWinningMessage(message: String)
    {
        //print(message)
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
                (action) -> Void in self.resetGame()
            }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func resetGame()
    {
        for label in labelsArray
        {
            label.text = ""
            label.canTap = true
        }
        xTurn = true
        gameOver = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        //print("tapped brotheeeer")
        if gameOver
        {
            return
        }
        var canPlay = false
        for label in labelsArray
        {
            if label.frame.contains(sender.location(in: backgroundView))
            {
                if label.canTap
                {
                    if(xTurn == true)
                    {
                        label.text = "X"
                    }
                    else
                    {
                        label.text = "O"
                    }
                    xTurn = !xTurn
                    label.canTap = false
                    checkForWinner()
                }
            }
            if label.canTap
            {
                canPlay = true
            }
        }
        if !canPlay && !gameOver
        {
            displayWinningMessage(message: "Cat's Game")
        }
    }
}

