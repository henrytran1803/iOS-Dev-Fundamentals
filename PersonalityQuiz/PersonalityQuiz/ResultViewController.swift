//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by henrytran1803 on 2/2/25.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        // Đếm tần suất của mỗi loại động vật
        let frequencyOfAnswers = responses.reduce(into: [AnimalType: Int]()) { counts, answer in
            counts[answer.type, default: 0] += 1
        }
        
        // Sắp xếp theo tần suất giảm dần và lấy loại phổ biến nhất
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        // Cập nhật UI với kết quả
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
    }
}
