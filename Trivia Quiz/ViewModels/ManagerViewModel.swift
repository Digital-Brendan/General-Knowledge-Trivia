//
//  ManagerViewModel.swift
//  Trivia Quiz
//
//  Created by Brendan Rogan on 02/08/2022.
//

import Foundation
import SwiftUI

class ManagerViewModel: ObservableObject {
    static var currentIndex = 0
    
    static func createGameModel(_ i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = ManagerViewModel.createGameModel(ManagerViewModel.currentIndex)
    
    @Published var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    func resetTimer() {
        timeRemaining = 10
    }
    
    func verifyAnswer(selectedOption: Answer) {
        // Unselect all cards to avoid multiple selections
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isCorrectAnswer = false
            model.quizModel.optionsList[index].isSelected = false
        }
        
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionID == selectedOption.optionID}) {
            
            if selectedOption.optionID == model.quizModel.answer {
                model.quizModel.optionsList[index].isCorrectAnswer = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (ManagerViewModel.currentIndex + 1 < ManagerViewModel.quizData.count) {
                        ManagerViewModel.currentIndex += 1
                        
                        self.model = ManagerViewModel.createGameModel(ManagerViewModel.currentIndex)
                        self.resetTimer()
                    } else {
                        self.model.hasCompleted = true
                        self.model.hasWon = true
                        self.resetTimer()
                    }
                }
            } else {
                model.quizModel.optionsList[index].isCorrectAnswer = false
                model.quizModel.optionsList[index].isSelected = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.model.hasCompleted = true
                    self.model.hasWon = false
                    self.resetTimer()
                }    
            }
        }
    }
    
    func canSelectAnswer() -> Bool {
        return model.quizModel.optionsList.filter{ $0.isSelected }.count == 0
    }
    
    func restartGame() {
        ManagerViewModel.currentIndex = 0
        model = ManagerViewModel.createGameModel(ManagerViewModel.currentIndex)
        self.resetTimer()
    }
}

// TODO: REPLACE WITH OPEN-TRIVIA-DB QUESTIONS: https://opentdb.com/api_config.php
extension ManagerViewModel {
    static var quizData: [QuizModel] {
            [
                QuizModel(question: "When did WW2 end?",
                          answer: "B",
                          optionsList: [Answer(id: 11, optionID: "A", option: "1944", colour: Color.yellow),
                                        Answer(id: 12, optionID: "B", option: "1945", colour: Color.cyan),
                                        Answer(id: 13, optionID: "C", option: "1946", colour: Color.green),
                                        Answer(id: 14, optionID: "D", option: "1947", colour: Color.red)]),
                
                QuizModel(question: "What did the Romans call Scotland?",
                          answer: "C",
                          optionsList: [Answer(id: 21, optionID: "A", option: "Hibernia", colour: Color.yellow),
                                        Answer(id: 22, optionID: "B", option: "Macedonia", colour: Color.cyan),
                                        Answer(id: 23, optionID: "C", option: "Caledonia", colour: Color.green),
                                        Answer(id: 24, optionID: "D", option: "Romania", colour: Color.red)]),
                
                QuizModel(question: "Which country gifted the Statue of Liberty?",
                          answer: "B",
                          optionsList: [Answer(id: 31, optionID: "A", option: "USA", colour: Color.yellow),
                                        Answer(id: 32, optionID: "B", option: "France", colour: Color.cyan),
                                        Answer(id: 33, optionID: "C", option: "Germany", colour: Color.green),
                                        Answer(id: 34, optionID: "D", option: "Ireland", colour: Color.red)]),
                
                QuizModel(question: "How many holes are in a full round of golf?",
                          answer: "A",
                          optionsList: [Answer(id: 31, optionID: "A", option: "18", colour: Color.yellow),
                                        Answer(id: 32, optionID: "B", option: "19", colour: Color.cyan),
                                        Answer(id: 33, optionID: "C", option: "15", colour: Color.green),
                                        Answer(id: 34, optionID: "D", option: "12", colour: Color.red)]),
                
                QuizModel(question: "What is the name of Harry Potter's father?",
                          answer: "B",
                          optionsList: [Answer(id: 31, optionID: "A", option: "Jack", colour: Color.yellow),
                                        Answer(id: 32, optionID: "B", option: "James", colour: Color.cyan),
                                        Answer(id: 33, optionID: "C", option: "John", colour: Color.green),
                                        Answer(id: 34, optionID: "D", option: "Harry", colour: Color.red)])
            ]
        }
}
