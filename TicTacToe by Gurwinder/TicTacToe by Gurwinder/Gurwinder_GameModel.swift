//
//  Gurwinder_GameModel.swift
//  TicTacToe by Gurwinder
//
//  Created by Gurwinder Singh on 2023-07-01.
//

import Foundation

class Gurwinder_GameModel {
    var whoseTurn = "X"
    var numberOfMovesPlayed = 0
    var lastPlayed = ""
    var whoWon = ""
    var isPastGame = false
    
    var squareContents = Array(repeating: "", count: 10)
    
    var orderOfMoves = [Int]()
    
    let winningCombinations = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]
    ]
    func playMove(tag: Int) {
        orderOfMoves.append(tag)
        squareContents[tag] = whoseTurn
        lastPlayed = whoseTurn
        if(whoseTurn == "X") {
            whoseTurn = "O"
        }else {
            whoseTurn = "X"
        }
        numberOfMovesPlayed += 1
    }
    func isGameFinished() -> Bool {
        if(numberOfMovesPlayed < 5) {
            return false
        }
      
        // check if anybody has won
        
        for winningCombination in winningCombinations {
            let index1 = winningCombination[0]
            let index2 = winningCombination[1]
            let index3 = winningCombination[2]
            
            if (squareContents[index1]  == lastPlayed  && squareContents[index2]  == lastPlayed  && squareContents[index3]  == lastPlayed) {
                //game over , won by lastplayed
                whoWon = lastPlayed
                saveGame()
                return true
            }
        }
        if(numberOfMovesPlayed == 9) {
            saveGame()
            return true
        }
        return false
    }
    func saveGame() {
        // if replay past game, dont save
        if(isPastGame) {
            return
        }
        let numGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        let gameNumber = numGamesPlayed + 1
        
        UserDefaults.standard.setValue(whoWon, forKey: Constants.WHO_WON + String(gameNumber))
        
        UserDefaults.standard.set(Date(), forKey: Constants.DATE_TIME + String(gameNumber))
        
        UserDefaults.standard.setValue(orderOfMoves, forKey: Constants.ORDER_OF_MOVES + String(gameNumber))
        
        UserDefaults.standard.set(gameNumber, forKey: Constants.NUM_GAMES)
        
        print("Game Saved")
    }
}
struct Constants {
    static let NUM_GAMES = "numberOfGamesPlayed"
    static let WHO_WON = "whoWon"
    static let DATE_TIME = "dateTime"
    static let ORDER_OF_MOVES = "orderOfMoves"
}
