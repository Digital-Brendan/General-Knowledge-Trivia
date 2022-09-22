//
//  QuizModel.swift
//  Trivia Quiz
//
//  Created by Brendan Rogan on 02/08/2022.
//

import Foundation
import SwiftUI

struct QuizModel {
    var question: String
    var answer: String
    var optionsList: [Answer]
}

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var hasCompleted: Bool = false
    var hasWon: Bool = false
}

struct Answer: Identifiable {
    var id: Int
    var optionID: String
    var option: String
    var colour: Color
    var isSelected: Bool = false
    var isCorrectAnswer: Bool = false
}
