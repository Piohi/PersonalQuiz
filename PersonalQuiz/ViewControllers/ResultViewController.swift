//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resaltDescription: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = calculatingResult(answers: answers)
        resultLabel.text = "Вы - \(result!.key.rawValue)"
        resaltDescription.text = result!.key.definition
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    //если сносить и функцию будет выглядеть ещё страшнее
    private func calculatingResult(answers: [Answer]) -> (key: Animal, value: Int)? {
        answers.compactMap {
            $0.animal
        }.reduce(
            into: [:]
        ){
            $0[
                $1,
                default: 0
            ] += 1
        }.sorted(by: {
            $0.1 > $1.1
        }).first
    }

}
