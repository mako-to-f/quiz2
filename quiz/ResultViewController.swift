//
//  ResultViewController.swift
//  quiz
//
//  Created by フジモト・マコト on 2019/01/19.
//  Copyright © 2019年 フジモト・マコト. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var correctLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let quizCount = QuizDataManager.sharedInstance.quizDataArray.count
        var correctCount: Int = 0
        for quizData in QuizDataManager.sharedInstance.quizDataArray {
            if quizData.isCorrect() {
                correctCount += 1
            }
        }
        correctLabel.text = String(correctCount) + "/5"
    }
}
