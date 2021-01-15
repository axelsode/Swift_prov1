//
//  ViewController.swift
//  Swift_prov1
//
//  Created by Axel Söderberg on 2021-01-11.
//

import UIKit

class ViewController: UIViewController {

    var playerNow = 1 //1 = nought play pice 2 = cross game pice
    var game = [0,0,0,0,0,0,0,0,0] //list of all pieces
    var gamePlaying = true
    
    let winnerCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func player1Label(_ sender: Any) {
    }
    @IBAction func player2Label(_ sender: Any) {
    }
    @IBOutlet weak var playerWinLabel: UILabel!
    @IBAction func action(_ sender: Any) {
        
        if(game[(sender as AnyObject).tag-1] == 0 && gamePlaying == true)
        {
            game[(sender as AnyObject).tag-1] = playerNow //only 1 press
            
            if (playerNow == 1)
            {
                (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                playerNow = 2
            }
            else{
                (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                playerNow = 1
            }
        }
        
        for comb in winnerCombination {
            if game[comb[0]] != 0 && game[comb[0]] == game[comb[1]] && game[comb[1]] == game[comb[2]]
            {
                gamePlaying = false
                
                if game[comb[0]] == 1{
                    // nought win
                    playerWinLabel.text = "Nought has won"
                    
                }
                else {
                    //cross win
                    playerWinLabel.text = "Cross has won"
                }
                
                restartButton.isHidden = false
                playerWinLabel.isHidden = false
                
            }
        }
        
        gamePlaying = false
        
        for i in game{
            if i == 0
            {
                gamePlaying = true
                break
            }
        }
        if gamePlaying == false
        {
            playerWinLabel.text = "It was a draw"
            playerWinLabel.isHidden = false
            restartButton.isHidden = false
        }
    }
    
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func restart(_ sender: Any) {
        
        game = [0,0,0,0,0,0,0,0,0]
        gamePlaying = true
        playerNow = 1
        
        playerWinLabel.isHidden = true
        restartButton.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

