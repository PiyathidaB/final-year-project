//
//  QuestViewController.swift
//  vr tour
//
//  Created by student on 21/8/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import UIKit
import  RealmSwift

class QuestionViewController: UIViewController, UITextFieldDelegate {
  
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceD: UIButton!
    @IBOutlet weak var questionCounted: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let allQuestion = QuestionDatabase()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    var nameTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("correct")
            score += 1
        }else{
            print("wrong")
        }
        questionNumber += 1
        updateQuestion()
        updateUI()
    }
    
    func updateQuestion(){
        if questionNumber <= allQuestion.list.count - 1{
            questionImage.image = UIImage (named: allQuestion.list[questionNumber].questionImage)
            questionLabel.text = allQuestion.list[questionNumber].question
            choiceA.setTitle(allQuestion.list[questionNumber].optionA, for: UIControl.State.normal)
            choiceB.setTitle(allQuestion.list[questionNumber].optionB, for: UIControl.State.normal)
            choiceC.setTitle(allQuestion.list[questionNumber].optionC, for: UIControl.State.normal)
            choiceD.setTitle(allQuestion.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = allQuestion.list[questionNumber].correctAnswer
        }else{
            setName()
        }
        
    }
    
    func updateUI(){
        scoreLabel.text = "Score:  \(score)"
        questionCounted.text = "\(questionNumber) : \(allQuestion.list.count)"
    }
    
    func addData(){
        let id = UserDatabase.addUser(name: nameTextField!.text ?? "Unknow", score: score)
    }
    
    func restartQuestion(){
        
    }
    
    func setName(){
        
        let alert = UIAlertController(title: "End of Quiz", message: "You score is \(score).", preferredStyle: .alert)
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"
            self.nameTextField = textField
        }

        let saveAction = UIAlertAction(title: "Ok", style: .default, handler: {
            action in self.addData()
            self.dismiss(animated: true, completion: nil)
        })
        
        let restartAction = UIAlertAction (title: "Restart", style: .default, handler: { action in self.restartQuestion()
            })
    
        alert.addAction(saveAction)
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
        
    }

}
