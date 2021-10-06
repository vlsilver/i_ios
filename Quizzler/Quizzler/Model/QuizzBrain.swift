//
//  QuizzBrain.swift
//  Quizzler
//
//  Created by niBVL on 06/10/2021.
//




import Foundation
struct QuizzBrain {
    let question = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")]
    var currentNumberQuestion = 0
    var currentScore = 0
    
    func getCurrentQuestion() -> String {
        return question[currentNumberQuestion].question
    }
    
    func  getCurrentAnswer1() -> String {
        return question[currentNumberQuestion].answer[0]
    }
    func  getCurrentAnswer2() -> String {
        return question[currentNumberQuestion].answer[1]
    }
    func  getCurrentAnswer3() -> String {
        return question[currentNumberQuestion].answer[2]
    }
    
    func  getCurrentAnswer() -> [String] {
        return question[currentNumberQuestion].answer
    }
    
    func  getCurrentScore() -> String {
        return "Score: \(currentScore)"
    }
    
    func  getCurrentProgress() -> Float {
        return Float(currentNumberQuestion + 1) / Float(question.count)
    }
    
    mutating func checkUserAnswer(answerOfUser: String) -> Bool {
        
        if currentNumberQuestion < question.count - 1
        {
            currentNumberQuestion += 1
        }
        else {
            currentNumberQuestion = 0
            currentScore = 0
        }
        if  answerOfUser == question[currentNumberQuestion].correctAnswer {
            currentScore += 1
            return true
        }
        else {
            return false
        }
        
    }
    
    
}

