//
//  OptionsGridView.swift
//  Trivia Quiz
//
//  Created by Brendan Rogan on 02/08/2022.
//

import SwiftUI
// Create grid of option cards
struct OptionsGridView: View {
    var managerViewModel: ManagerViewModel

    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 0), count: 2)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(managerViewModel.model.quizModel.optionsList) { quizOption in
                OptionButton(quizOption: quizOption, managerViewModel: managerViewModel)
            }
        }
    }
}

struct ButtonPressScaleEffect: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.90 : 1.0)
    }
}

struct OptionButton: View {
    var quizOption: Answer
    var managerViewModel: ManagerViewModel
    
    var body: some View {
        Button(action: {}) {
            VStack {
                OptionCircle(quizOption: quizOption)

                Text(quizOption.option)
            }
            .font(.system(size: 25, weight: .bold, design: .rounded))
            .frame(width: 150, height: 150)
            .foregroundColor(.white)
            .background(managerViewModel.canSelectAnswer() ? .white.opacity(0.25) : quizOption.isCorrectAnswer ? .green : .red)
            .cornerRadius(40)
            .onTapGesture {
                managerViewModel.verifyAnswer(selectedOption: quizOption)
            }
        }
        .buttonStyle(ButtonPressScaleEffect())
    }
}

struct OptionCircle: View {
    var quizOption: Answer
    var body: some View {
        Text(quizOption.optionID)
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .frame(width: 50, height: 50)
            .background(quizOption.colour.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(25)
    }
}


//// Create single option card
//struct OptionCardView: View {
//    var quizOption: Answer
//
//    // Show white card as default until one is selected as user answer
//    var body: some View {
//        VStack {
//            if (quizOption.isCorrectAnswer && quizOption.isSelected) {
//                OptionStatusImageView(imageName: "checkmark")
//            } else if (!quizOption.isCorrectAnswer && quizOption.isSelected) {
//                OptionStatusImageView(imageName: "xmark")
//            } else {
//                OptionView(quizOption: quizOption)
//            }
//        }
//        .frame(width: 150, height: 150)
//        .background(setColour())
//        .cornerRadius(40)
//
//    func setColour() -> Color {
//        if (quizOption.isCorrectAnswer && quizOption.isSelected) {
//            return Color.green
//        } else if (!quizOption.isCorrectAnswer && quizOption.isSelected) {
//            return Color.red
//        } else {
//            return Color.white
//        }
//    }
//}
//
//// Create coloured circle for each option card
//struct OptionView: View {
//    var quizOption: Answer
//    var body: some View {
//        VStack{
//            Text(quizOption.optionID)
//                .font(.system(size: 30, weight: .bold, design: .rounded))
//                .frame(width: 50, height: 50)
//                .background(quizOption.colour.opacity(0.7))
//                .foregroundColor(.white)
//                .cornerRadius(25)
//
//            Text(quizOption.option)
//                .frame(width: 150, height: 38)
//                .font(.system(size: 20, weight: .bold, design: .rounded))
//        }
//    }
//}
//
//// Display appropriate card overlay (if correct answer chosen)
//struct OptionStatusImageView: View {
//    var imageName: String
//    var body: some View {
//        Image(systemName: imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
//            .foregroundColor(Color.white)
//    }
//}
