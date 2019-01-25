//
//  StartViewController.swift
//  quiz
//
//  Created by フジモト・マコト on 2019/01/19.
//  Copyright © 2019年 フジモト・マコト. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        QuizDataManager.sharedInstance.loadQuiz()
        
        guard let nextViewController = segue.destination as? QuizViewController else {
            return
        }
        
        guard let quizData = QuizDataManager.sharedInstance.nextQuiz() else {
            return
        }
        
        nextViewController.quizData = quizData
    }
}
