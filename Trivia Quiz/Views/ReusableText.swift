//
//  ReusableText.swift
//  Trivia Quiz
//
//  Created by Brendan Rogan on 02/08/2022.
//
import Foundation
import SwiftUI

// Application-wide text standard
struct ReusableText: View {
    var text: String
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .shadow(color: .purple, radius: 2, x: 0, y: 2)
    }
}
