//
//  QuestionDatabase.swift
//  vr tour
//
//  Created by student on 16/9/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import Foundation

class QuestionDatabase{
    var list = [Question]()
    
    init() {
        list.append(Question(image: "wat-mahathat", questionText: "What is the name of the temple", choiceA: "Wat Mahathat", choiceB: "Wat Sasi", choiceC: "Wat Sisawhai", choiceD: "Wat Sichum", answer: 1))
        
        list.append(Question(image: "wat-sasi", questionText: "What is the name of the temple", choiceA: "Wat Mahathat", choiceB: "Wat Sasi", choiceC: "Wat Sisawhai", choiceD: "Wat Sichum", answer: 2))
        
        list.append(Question(image: "wat-sisawhal", questionText: "What is the name of the temple", choiceA: "Wat Mahathat", choiceB: "Wat Sasi", choiceC: "Wat Sisawhai", choiceD: "Wat Sichum", answer: 3))
        
        list.append(Question(image: "wat-sichum", questionText: "What is the name of the temple", choiceA: "Wat Mahathat", choiceB: "Wat Sasi", choiceC: "Wat Sisawhai", choiceD: "Wat Sichum", answer: 4))
        
        list.append(Question(image: "wat-mahathat", questionText: "What is the name of the temple", choiceA: "Wat Mahathat", choiceB: "Wat Sasi", choiceC: "Wat Sisawhai", choiceD: "Wat Sichum", answer: 1))
    }
}
