//
//  Question.swift
//  Quizzler
//
//  Created by niBVL on 06/10/2021.
//

import Foundation
struct Question {
    let question: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
