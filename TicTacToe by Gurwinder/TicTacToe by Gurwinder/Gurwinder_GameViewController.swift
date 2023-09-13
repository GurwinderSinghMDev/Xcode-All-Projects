//
//  Gurwinder_GameViewController.swift
//  TicTacToe by Gurwinder
//
//  Created by Gurwinder Singh on 2023-07-01.
//

import UIKit

class Gurwinder_GameViewController: UIViewController {
    
    // Mark:- Class variables
    var theGameModel = Gurwinder_GameModel()
    var gameFinished = false
    var pastGameData : GameData?
    var replayingPastGame = false
    
// Mark:- Outlets
    @IBOutlet weak var gameStateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (replayingPastGame) {
            navigationItem.title = "Past Game"
            if(replayingPastGame) {
                theGameModel.isPastGame = true
            }
            // play the moves from past game
            let pastGameMoves = pastGameData?.orderOfMoves
            var delay : Double = 0.0
            for move in pastGameMoves! {
                delay += 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + delay,
                                              execute: {
                    let button = self.view.viewWithTag(move)
                    self.playTheMove(button as! UIButton)
                })
            }
            
        }else {
            
        }
    }
    // Mark:- Actions
    

    @IBAction func squareTouched(_ sender: UIButton) {
        if (!replayingPastGame) {
            playTheMove(sender)
        }
    }
        func  playTheMove(_ sender: UIButton) {
        print("Button Touched")
        print(sender.tag)
        
        if(sender.currentTitle == "X"  || sender.currentTitle == "O" || gameFinished){
            return
        }
       sender.setTitle(theGameModel.whoseTurn, for: .normal)
        theGameModel.playMove(tag: sender.tag)
        
        if(theGameModel.isGameFinished()){
            let winner = theGameModel.whoWon
            if (winner.count > 0){
                gameStateLabel.text = winner + "  won!"
            }else {
                gameStateLabel.text = "Draw"
            }
           gameFinished = true
        }else{
            gameStateLabel.text = theGameModel.whoseTurn + "'s Turns"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
