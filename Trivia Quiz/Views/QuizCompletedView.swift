//
//  QuizCompletedView.swift
//  Trivia Quiz
//
//  Created by Brendan Rogan on 04/08/2022.
//

import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var managerViewModel: ManagerViewModel
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 60))
                .padding()
            
            ReusableText(text: managerViewModel.model.hasWon ? "Well Done!" : "Game Over!", size: 30)
                .padding()
            
            ReusableText(text: managerViewModel.model.hasWon ? "Thank you for playing" : "Try again", size: 30)
                .padding()
            
            Button {
                managerViewModel.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Play Again")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.white.opacity(0.25))
                .cornerRadius(30)
                .padding()
        }
    }
}
