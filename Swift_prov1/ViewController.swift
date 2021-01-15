import UIKit

class ViewController: UIViewController {

    var namePlayer1 : String?
    var namePlayer2 : String?
    var playerNow = 1 //1 = nought play pice 2 = cross game pice
    var game = [0,0,0,0,0,0,0,0,0] //list of all pieces
    var gamePlaying = true
    
    let winnerCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet weak var Player1: UILabel!
    @IBOutlet weak var Player2: UILabel!
    
    @IBOutlet weak var playerWinLabel: UILabel!
    
    @IBAction func action(_ sender: Any) { //all 9 buttons connected to this action
        
        
        if(game[(sender as AnyObject).tag-1] == 0 && gamePlaying == true)
        {
            game[(sender as AnyObject).tag-1] = playerNow //only 1 press
            
            playerWinLabel.text = "Player 1 to go"
            playerWinLabel.isHidden = false
            
            if (playerNow == 1)
            {
                (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                playerWinLabel.text = "Player 2 to play"
                
                playerNow = 2
            }
            if (playerNow == 2){
                (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                playerWinLabel.text = "Player 1 to play"
                playerNow = 1
            }
            playerWinLabel.isHidden = false
        }
        
        for comb in winnerCombination {
            if game[comb[0]] != 0 && game[comb[0]] == game[comb[1]] && game[comb[1]] == game[comb[2]]
            {
                gamePlaying = false
                
                if game[comb[0]] == 1{
                    // nought win
                    playerWinLabel.text = "Player 1 has won"
                    
                }
                if game[comb[0]] == 2 {
                    //cross win
                    playerWinLabel.text = "Player 2 has won"
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
        
        //looping threw all the views and setting them to buttons
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        	
    @IBAction func Exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }

}

