//
//  Trivia_QuizApp.swift
//  Trivia Quiz
//
//  Created by Brendan Rogan on 02/08/2022.
//

import SwiftUI

@main
struct Trivia_QuizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(managerViewModel: ManagerViewModel())
        }
    }
}
