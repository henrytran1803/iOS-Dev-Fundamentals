//
//  ViewController.swift
//  Apple Pie
//
//  Created by henrytran1803 on 1/30/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var treeImageView: UIImageView!

    @IBOutlet weak var scoreLabelView: UILabel!
    @IBOutlet weak var correctLabelView: UILabel!
        
    @IBOutlet var letterButtons: [UIButton]!
    var listOfWords = ["swift", "bug", "program", "glorious"]
    let incorrectMovesAllow = 7
    var totalWin = 0{
        didSet {
            newRound()
        }
    }
    var totalLose = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame : Game!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLose += 1
            enableLetterButtons(false)  // Disable các nút khi thua
        } else if currentGame.word == currentGame.formatLetterWord {
            totalWin += 1
            enableLetterButtons(false)  // Disable các nút khi thắng
        } else {
            updateUI()
        }
    }
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeLast()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllow, guessedLetter: [])
            enableLetterButtons(true)  // Enable lại tất cả các nút khi bắt đầu vòng mới
            updateUI()
        } else {
            // Không còn từ nào trong danh sách
            enableLetterButtons(false)  // Disable tất cả các nút
        }
    }
    
    func enableLetterButtons(_ enable: Bool){
         for button in letterButtons {
            button.isEnabled = enable
        }
    }
    func updateUI(){
        
        var letters = [String]()
        for letter in currentGame.formatLetterWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        scoreLabelView.text = "Wins: \(totalWin), Loses: \(totalLose)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
        correctLabelView.text = currentGame.formatLetterWord
        
    }
    
}

struct Game {
    var word : String
    var incorrectMovesRemaining : Int
    var guessedLetter : [Character]
    var formatLetterWord : String {
        var gussedWord = ""
        for letter in word {
            if guessedLetter.contains(letter){
                gussedWord += "\(letter)"
            }else {
                gussedWord += "_"
            }
        }
        return gussedWord
    }
    mutating func playerGuessed(letter: Character){
        guessedLetter.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}

