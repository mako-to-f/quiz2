//
//  File.swift
//  quiz
//
//  Created by フジモト・マコト on 2019/01/18.
//  Copyright © 2019年 フジモト・マコト. All rights reserved.
//

import Foundation

class QuizData {
    var quiz: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var correctNumber: Int
    
    var userChoiceNumber: Int?
//    var quizNumber: Int = 1
    
    init(quizSourceDataArray: [String]) {
        quiz = quizSourceDataArray[0]
        answer1 = quizSourceDataArray[1]
        answer2 = quizSourceDataArray[2]
        answer3 = quizSourceDataArray[3]
        answer4 = quizSourceDataArray[4]
        correctNumber = Int(quizSourceDataArray[5])!
    }
    
    func isCorrect() -> Bool {
        if correctNumber == userChoiceNumber {
            return true
        } else {
            return false
        }
    }
}

class QuizDataManager {
    static let sharedInstance = QuizDataManager()
    var quizDataArray = [QuizData]()
    var nowQuizIndex: Int = 0
    
//    シングルトンであることを保証するためprivateで宣言する
    private init() {
    }
    
    func loadQuiz() {
        quizDataArray.removeAll()
        nowQuizIndex = 0
        
//        CSVファイルの取得
        guard let csvFilePath = Bundle.main.path(forResource: "quiz", ofType: "csv") else {
            print("csvファイルが存在しません")
            return
        }
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            csvStringData.enumerateLines(invoking: { (line, stop) in
                let quizSourceDataArray = line.components(separatedBy: ",")
                let quizData = QuizData(quizSourceDataArray: quizSourceDataArray)
                self.quizDataArray.append(quizData)
//                quizData.quizNumber = self.quizDataArray.count
            })
            quizDataArray.shuffle()
        }
        catch let error {
            print("csvファイル読み込みエラーが発生しました:\(error)")
        }
    }
    
    func nextQuiz() -> QuizData? {
        if nowQuizIndex < quizDataArray.count {
            let nextQuiz = quizDataArray[nowQuizIndex]
            nowQuizIndex += 1
            return nextQuiz
        }
        return nil
    }
}
