//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {

    var answers: [Answer]!
    var animals: [Animal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for answer in answers {
            animals.append(answer.animal)
        }
        let count = animals.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        let result = count.sorted(by: { $0.1 > $1.1 }).first

        
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
