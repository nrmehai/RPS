//
//  ViewController.swift
//  RPS
//
//  Created by Noor Mehai on 3/22/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var playerRock: UIButton!
    @IBOutlet weak var playerPaper: UIButton!
    @IBOutlet weak var playerScissors: UIButton!
    @IBOutlet var background: UIView!
    @IBOutlet weak var playAgain: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(state: .Start)
    }

    
    @IBAction func rockButton(_ sender: UIButton) {
        let opponent = randomSign()
        appSign.text = opponent.emoji()
        playerPaper.isHidden = true
        playerScissors.isHidden = true
        updateUI(state: Sign.rock.compareTo(opponent: opponent))
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        let opponent = randomSign()
        appSign.text = opponent.emoji()
        playerRock.isHidden = true
        playerScissors.isHidden = true
        updateUI(state: Sign.paper.compareTo(opponent: opponent))
    }
    
    @IBAction func scissorsButton(_ sender: UIButton) {
        let opponent = randomSign()
        appSign.text = opponent.emoji()
        playerPaper.isHidden = true
        playerRock.isHidden = true
        updateUI(state: Sign.scissors.compareTo(opponent: opponent))
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        updateUI(state: .Start)
    }
    
    func updateUI(state: GameState){
        switch state {
        case .Start:
            
            background.backgroundColor = .white
            appSign.text = "🤖"
            playerRock.isEnabled = true
            playerPaper.isEnabled = true
            playerScissors.isEnabled = true
            playAgain.isHidden = true
            playerRock.isHidden = false
            playerPaper.isHidden = false
            playerScissors.isHidden = false
            statusLabel.text = "Choose: Rock, Paper, or Scissors"
            
        case .Win:
            playAgain.isHidden = false
            playerRock.isEnabled = false
            playerPaper.isEnabled = false
            playerScissors.isEnabled = false
            background.backgroundColor = .green
            statusLabel.text = "YOU WON!"
            
        case .Lose:
            playAgain.isHidden = false
            playerRock.isEnabled = false
            playerPaper.isEnabled = false
            playerScissors.isEnabled = false
            background.backgroundColor = .red
            statusLabel.text = "You Lost :("
            
        case .Draw:
            playAgain.isHidden = false
            playerRock.isEnabled = false
            playerPaper.isEnabled = false
            playerScissors.isEnabled = false
            background.backgroundColor = .cyan
            statusLabel.text = "It's a Draw!"
        }
        
    }
    
}

