//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Избавиться от кнопкп возврата
    // 2. Передать сюда массив с выбранными ответами
    // 3. Определить то животное, которое встречается чаще всего
    // 4. Отобразить результаты
    // 5. Подумать над логикой определени индекса в соответсвии с диапазоном
    
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var resultsDescriptionLabel: UILabel!
    
    var answersChosenTemp = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the "Back" button.
        navigationItem.setHidesBackButton(true, animated: true)
        // Display the results at two labels.
        resultsLabel.text = "Вы - \(yourAnimal(answers: answersChosenTemp).rawValue)"
        resultsDescriptionLabel.text = yourAnimal(answers: answersChosenTemp).definition
    }
}
extension ResultsViewController {
    // Identification the most common animal
    private func yourAnimal(answers: [Answer]) -> AnimalType {
        // Создание словаря
        var newArray = [PersonalQuiz.AnimalType]()
        for answerType in answers {
            newArray.append(answerType.type)
        }
        let result = Dictionary(grouping: newArray){ $0 }.mapValues { $0.count }
        // Выявление самого часто встречающегося ключа
        var maxNumberOfOccurrence = 0
        var mostCommonName: AnimalType?
        for key in result.keys {
            if result[key]! > maxNumberOfOccurrence {
                maxNumberOfOccurrence = result[key]!
                mostCommonName = key
            }
        }
        return mostCommonName!
    }
}



