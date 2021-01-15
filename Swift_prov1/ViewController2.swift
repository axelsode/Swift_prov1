import Foundation

import UIKit

class ViewController2: UIViewController{
    
    
    
    @IBOutlet weak var firstpage1: UITextField!
    
    
    @IBOutlet weak var firstpage2: UITextField!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        firstpage1.text = "test"
//        firstpage2.text = "test"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToGame"{
       let destinationVC = segue.destination as! ViewController
   //    destinationVC.namePlayer1 = player1FirstPage.text
   //         destinationVC.namePlayer2 = player2FirstPage.text
            
        }
    }
    
    @IBAction func StartGame(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoToGame", sender: self)
    }
    
    
}
