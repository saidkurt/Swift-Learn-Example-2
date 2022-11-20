//
//  ViewController.swift
//  Dice Game
//
//  Created by saidkurt on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerOneScore: UILabel!
    
    @IBOutlet weak var playerTwoScore: UILabel!
    
    @IBOutlet weak var playerOnePoint: UILabel!
    
    @IBOutlet weak var playerTwoPoint: UILabel!
    
    @IBOutlet weak var playerOneSituation: UIImageView!
    
    @IBOutlet weak var playerTwoSituation: UIImageView!
    
    @IBOutlet weak var imageDiceOne: UIImageView!
    
    @IBOutlet weak var imageDiceTwo: UIImageView!
    
    @IBOutlet weak var gameSituarion: UILabel!
    
    private var isPlayerOne : Bool = true
    private var playerScore : (playerOneScore : Int, playerTwoScore : Int) = (0,0)
    private var diceScore : (playerOneDiceScore : Int,playerTwoDiceScore : Int) = (0,0)
    private let totalGameCount : Int = 5
    private var currentGameCount : Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "arkaPlan"){
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
    }
    
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if currentGameCount < totalGameCount {
            startGame()
        }
        
   }
    
    
    func startGame(){
        let diceOne = arc4random_uniform(6) + 1
        let diceTwo = arc4random_uniform(6) + 1
        imageDiceOne.image = UIImage(named: String(diceOne))
        imageDiceTwo.image = UIImage(named: String(diceTwo))
        gameSituarion.text = "Player 2 Turn !!"
            if isPlayerOne{
            diceScore.playerOneDiceScore = Int(diceOne) + Int(diceTwo)
            playerOnePoint.text = String(diceScore.playerOneDiceScore)
            playerOneSituation.image = UIImage(named:"bekle")
            playerTwoSituation.image = UIImage(named:"onay")
            isPlayerOne = false
            playerTwoPoint.text = "0"
            
            

        }else {
            diceScore.playerTwoDiceScore = Int(diceOne) + Int(diceTwo)
            playerTwoPoint.text = String(diceScore.playerTwoDiceScore)
            playerTwoSituation.image = UIImage(named:"bekle")
            playerOneSituation.image = UIImage(named:"onay")
            isPlayerOne = true
            playerOnePoint.text = "0"
            
            
        }
        
        if diceScore.playerOneDiceScore > diceScore.playerTwoDiceScore {
            playerScore.playerOneScore+=1
            playerOneScore.text = String(playerScore.playerOneScore)
            currentGameCount += 1
            gameSituarion.text = "Player 1 Won This Turn !!"
        }else if diceScore.playerOneDiceScore < diceScore.playerTwoDiceScore {
            playerScore.playerTwoScore+=1
            playerTwoScore.text = String(playerScore.playerTwoScore)
            currentGameCount += 1
            gameSituarion.text = "Player 2 Won This Turn !!"
        }
        
    }
}
