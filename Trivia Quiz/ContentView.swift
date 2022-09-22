//
//  ContentView.swift
//  Trivia Quiz
//
//  Created by Brendan Rogan on 02/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var managerViewModel: ManagerViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.cyan.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            if (managerViewModel.model.hasCompleted) {
                QuizCompletedView(managerViewModel: managerViewModel)
            } else {
                VStack {
                    ReusableText(text: "Trivia Quiz", size: 35)
                        .padding()
                    
                    ReusableText(text: managerViewModel.model.quizModel.question, size: 25)
                        .frame(width: UIScreen.main.bounds.size.width - 30, height: 60, alignment: .center)
                        .multilineTextAlignment(.center)
                    Spacer()
                    CountdownView(managerViewModel: managerViewModel)
                    Spacer()
                    OptionsGridView(managerViewModel: managerViewModel)
                }
                .onReceive(managerViewModel.timer) { time in
                    if (managerViewModel.timeRemaining <= 0) {
                        managerViewModel.model.hasWon = false
                        managerViewModel.model.hasCompleted = true
                    } else {
                        managerViewModel.timeRemaining -= 1
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(managerViewModel: ManagerViewModel())
    }
}
