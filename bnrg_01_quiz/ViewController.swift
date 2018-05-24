//
//  ViewController.swift
//  bnrg_01_quiz
//
//  Created by Admin on 17.05.2018.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0;
        }
        let question = questions[currentQuestionIndex]
        nextQuestionLabel.text = question;
        answerLabel.text = "???";
        
        animateLabelTransitions()
    }
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func updateOffScreenLabel(){
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    func animateLabelTransitions(){
        view.layoutIfNeeded()
        // Animation
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseInOut],
                       //options: [],
                       animations: {
                            () -> Void in
                            self.currentQuestionLabel.alpha = 0
                            self.nextQuestionLabel.alpha = 1
                        
                            self.view.layoutIfNeeded()
                        },
                       completion: { _ in
                            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                            swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                        
                            self.updateOffScreenLabel()
                        }
                       )// animate
    } // func
    
}

