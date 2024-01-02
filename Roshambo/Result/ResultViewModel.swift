//
//  ResultViewModel.swift
//  Roshambo
//
//  Created by Lucas Lopes on 02/01/24.
//

import Foundation

class ResultViewModel: ObservableObject{
    
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
