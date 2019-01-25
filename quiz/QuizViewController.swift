//
//  ViewController.swift
//  quiz
//
//  Created by フジモト・マコト on 2019/01/18.
//  Copyright © 2019年 フジモト・マコト. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    var quizData: QuizData!
    
    @IBOutlet weak var quizNumberLabel: UILabel!
    
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hide()
        quizNumberLabel.text = "Question"
        quizTextView.text = quizData.quiz
        answerButton1.setTitle(quizData.answer1, for: .normal)
        answerButton2.setTitle(quizData.answer2, for: .normal)
        answerButton3.setTitle(quizData.answer3, for: .normal)
        answerButton4.setTitle(quizData.answer4, for: .normal)
    }
    
    @IBAction func answerButton1Action(_ sender: Any) {
        quizData.userChoiceNumber = 1
        answerButton1.alpha = 1
        answerButton2.alpha = 0.5
        answerButton3.alpha = 0.5
        answerButton4.alpha = 0.5
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        result()
    }
    
    @IBAction func answerButton2Action(_ sender: Any) {
        quizData.userChoiceNumber = 2
        answerButton1.alpha = 0.5
        answerButton2.alpha = 1
        answerButton3.alpha = 0.5
        answerButton4.alpha = 0.5
        answerButton1.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        result()
    }
    
    @IBAction func answerButton3Action(_ sender: Any) {
        quizData.userChoiceNumber = 3
        answerButton1.alpha = 0.5
        answerButton2.alpha = 0.5
        answerButton3.alpha = 1
        answerButton4.alpha = 0.5
        answerButton2.isEnabled = false
        answerButton1.isEnabled = false
        answerButton4.isEnabled = false
        result()
    }
    
    @IBAction func answerButton4Action(_ sender: Any) {
        quizData.userChoiceNumber = 4
        answerButton1.alpha = 0.5
        answerButton2.alpha = 0.5
        answerButton3.alpha = 0.5
        answerButton4.alpha = 1
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton1.isEnabled = false
        result()
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        goNextQuiz()
    }
    
    func hide() {
        nextButton.isHidden = true
        resultLabel.isHidden = true
    }
    
    func unhide() {
        nextButton.isHidden = false
        resultLabel.isHidden = false
    }
    
    func result() {
        unhide()
        if quizData.isCorrect() {
            resultLabel.text = "Correct!"
        } else {
            resultLabel.text = "Wrong!"
        }
    }
    
    func goNextQuiz() {
        guard let nextQuiz = QuizDataManager.sharedInstance.nextQuiz() else {
            if let resultViewController = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultViewController {
                present(resultViewController, animated: true, completion: nil)
            }
            return
        }
        
        if let nextQuizViewController = storyboard?.instantiateViewController(withIdentifier: "quiz") as? QuizViewController {
            nextQuizViewController.quizData = nextQuiz
            present(nextQuizViewController, animated: true, completion: nil)
        }
    }
}
