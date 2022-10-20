//
//  ResultsViewController.swift
//  PersonalityQuiz_Abdelmalak
//
//  Created by Mena Abdelmalak on 10/3/22.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses:[Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton=true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult(){
        var frequencyOfAnswers: [AnimalType:Int]=[:]
        let responseTypes = responses.map{$0.type}
        for response in responseTypes{
            frequencyOfAnswers[response]=(frequencyOfAnswers[response] ?? 0) + 1
        }
        let frequentAnswersSorted=frequencyOfAnswers.sorted(by:{
            (pair1,pair2) -> Bool in
            return pair1.value>pair2.value})
        let mostCommonAnswer = frequentAnswersSorted.sorted{$0.1>$1.1}.first!.key
        
        resultAnswerLabel.text="You are a\(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text=mostCommonAnswer.definition
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
