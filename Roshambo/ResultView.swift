//
//  RPSMatch.swift
//  Roshambo
//
//  Created by Lucas Lopes on 26/12/23.
//

import SwiftUI

struct ResultView: View {
    @Binding var result: RPSMatch!
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    
    @State private var animate = false
    
    var body: some View {
        
        VStack{
            Image(imageForMatch(result)).opacity(animate ? 1.0 : 0.2)
            Text(messageForMatch(result))
            Spacer().frame(height: 50)
            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                Text("Play Again")
            })
        }.onAppear {
            withAnimation(Animation.easeInOut(duration: 1.5)){
                animate.toggle()
            }
        }
    }
    
    // MARK: Messages for Match
    
    func messageForMatch(_ match: RPSMatch) -> String {
        
        // Handle the tie
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        // Here we build up the results message "RockCrushesScissors. You Win!" etc.
        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(_ match: RPSMatch) -> String {
        return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
    }
    
    
    func victoryModeString(_ gesture: RPS) -> String {
        switch (gesture) {
        case .rock:
            return "crushes"
        case .scissors:
            return "cuts"
        case .paper:
            return "covers"
        }
    }
    
    // MARK: Image for Match
    
    func imageForMatch(_ match: RPSMatch) -> String {
        
        var name = ""
        
        switch (match.winner) {
        case .rock:
            name = "RockCrushesScissors"
        case .paper:
            name = "PaperCoversRock"
        case .scissors:
            name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return name
    }
}

#Preview {
    ResultView(result: Binding.constant(RPSMatch(p1: RPS(), p2: RPS())))
}
