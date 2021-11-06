//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var userScore: UILabel!
    
    var quizBrain = QuizBrain()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
        
        let userGotItRight = quizBrain.chekAnswer(userAnswer)
       
        if userGotItRight  {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI) , userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLable.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        answerButton1.setTitle(quizBrain.getAnswers()[0], for: .normal)
        answerButton2.setTitle(quizBrain.getAnswers()[1], for: .normal)
        answerButton3.setTitle(quizBrain.getAnswers()[2], for: .normal)
        userScore.text = "Score: \(quizBrain.getScore())"
        answerButton2.backgroundColor = UIColor.clear
        answerButton3.backgroundColor = UIColor.clear
        answerButton1.backgroundColor = UIColor.clear
    }

}

