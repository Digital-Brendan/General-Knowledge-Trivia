//
//  CountdownView.swift
//  Trivia Quiz
//
//  Created by Brendan Rogan on 05/08/2022.
//

import SwiftUI

struct CountdownView: View {
    //@ObservedObject var countdownViewModel: CountdownViewModel
    @ObservedObject var managerViewModel: ManagerViewModel
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.white.opacity(0.5), lineWidth: 6)
                .frame(width: 230, height: 230)

            ReusableText(text: "\(managerViewModel.timeRemaining)", size: 60)

            Circle()
                .trim(from: 0, to: CGFloat(managerViewModel.timeRemaining)/10)
                .stroke(LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 230, height: 230)
                .rotationEffect(.degrees(-90))
                //.animation(.linear(duration: 1.0), value: managerViewModel.timeRemaining)
                .animation(.easeOut(duration: 0.8), value: managerViewModel.timeRemaining)
        }
    }
}
