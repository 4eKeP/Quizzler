//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by admin on 13.07.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    
    init(q:String, a:[String], c: String) {
        answer = a
        text = q
        correctAnswer = c
    }
}
