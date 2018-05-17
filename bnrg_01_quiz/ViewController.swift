//
//  ViewController.swift
//  bnrg_01_quiz
//
//  Created by Admin on 17.05.2018.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let questions: [String] = [
        "Capital of Russia?",
        "How much is the fish?",
        "What is cheese made of?",
    ]
    
    let answers = [
        "Moscow",
        "42",
        "Milk"
    ]
    
    var currentQuestionIndex = 0;
    
    @IBAction func showNextQuestion(_ sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0;
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question;
        answerLabel.text = "???";
    }
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
}

