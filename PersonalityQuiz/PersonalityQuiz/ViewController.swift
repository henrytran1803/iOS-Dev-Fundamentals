//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by henrytran1803 on 2/2/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

struct Question {
    var text : String
    var type : ResponseType
    var answers: [Answer]
}
enum ResponseType {
    case single, multiple, ranged
}
struct Answer {
    var text: String
    var type: AnimalType

}
enum AnimalType: Character {
   case lion = "🦁"
   case cat = "🐱"
   case rabbit = "🐰"
   case turtle = "🐢"
   
   var definition: String {
       switch self {
       case .lion:
           return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
       case .cat:
           return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
       case .rabbit:
           return "You love everything that's soft. You are healthy and full of energy."
       case .turtle:
           return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
       }
   }
}
