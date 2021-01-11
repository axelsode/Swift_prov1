//
//  ViewController.swift
//  Swift_prov1
//
//  Created by Axel Söderberg on 2021-01-11.
//

import UIKit

class ViewController: UIViewController {

    var playerNow = 1 //Circul
    var game = [0,0,0,0,0,0,0,0,0] //list of all pieces
    
    let winnerCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func action(_ sender: Any) {
        
        if(game[(sender as AnyObject).tag-1] == 0)
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

