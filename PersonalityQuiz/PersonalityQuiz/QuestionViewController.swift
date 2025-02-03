//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by henrytran1803 on 2/2/25.
//

import UIKit

class QuestionViewController: UIViewController {
    // MARK: - IBOutlets
    // Single
    @IBOutlet weak var questionLabelView: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    // Multiple
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var multipleLabel2: UILabel!
    @IBOutlet weak var multipleLabel3: UILabel!
    @IBOutlet weak var multipleLabel4: UILabel!
    @IBOutlet weak var mutiSwitch1: UISwitch!
    @IBOutlet weak var mutiSwitch2: UISwitch!
    @IBOutlet weak var mutiSwitch3: UISwitch!
    @IBOutlet weak var mutiSwitch4: UISwitch!
    @IBOutlet weak var submitButton: UIButton!
    
    // Ranged
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    // MARK: - Properties
    var questionIndex = 0
    var answersChosen: [Answer] = []
    var questions: [Question] = [
        Question(
            text: "Which food do you like the most?",
            type: .single,
            answers: [
                Answer(text: "Steak", type: .lion),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle)
            ]
        ),
        Question(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
                Answer(text: "Swimming", type: .turtle),
                Answer(text: "Sleeping", type: .cat),
                Answer(text: "Cuddling", type: .rabbit),
                Answer(text: "Eating", type: .lion)
            ]
        ),
        Question(
            text: "How much do you enjoy car rides?",
            type: .ranged,
            answers: [
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
                Answer(text: "I love them", type: .lion)
            ]
        )
    ]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Results" {
            let resultsViewController = segue.destination as! ResultViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    // MARK: - UI Updates
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabelView.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
        
        mutiSwitch1.isOn = false
        mutiSwitch2.isOn = false
        mutiSwitch3.isOn = false
        mutiSwitch4.isOn = false
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    // MARK: - Actions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1: answersChosen.append(currentAnswers[0])
        case singleButton2: answersChosen.append(currentAnswers[1])
        case singleButton3: answersChosen.append(currentAnswers[2])
        case singleButton4: answersChosen.append(currentAnswers[3])
        default: break
        }
        nextQuestion()
    }
    
    @IBAction func submitButtonPressed() {
        switch questions[questionIndex].type {
        case .multiple:
            handleMultipleAnswer()
        case .ranged:
            handleRangedAnswer()
        default:
            break
        }
    }
    
    // MARK: - Helper Methods
    private func handleMultipleAnswer() {
        let currentAnswers = questions[questionIndex].answers
        let switches = [mutiSwitch1, mutiSwitch2, mutiSwitch3, mutiSwitch4]
        
        for (index, switchControl) in switches.enumerated() where ((switchControl?.isOn) != nil) {
            answersChosen.append(currentAnswers[index])
        }
        nextQuestion()
    }
    
    private func handleRangedAnswer() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    // Thiếu IBAction này trong code
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if mutiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if mutiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if mutiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if mutiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    // MARK: - Actions
    @IBAction func rangedAnswerButtonPressed() {
       let currentAnswers = questions[questionIndex].answers
       let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
       answersChosen.append(currentAnswers[index])
       nextQuestion()
    }
}
