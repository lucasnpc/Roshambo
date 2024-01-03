//
//  HistoryViewModel.swift
//  Roshambo
//
//  Created by Lucas Lopes on 03/01/24.
//

import Foundation

class HistoryViewModel: ObservableObject{
    
    //MARK: Get Match Info
    func matchInfo(rpsMatch: RPSMatch) -> String{
        var result = ""
        if rpsMatch.p1 == rpsMatch.p2 {
            result = "Tie."
        } else if rpsMatch.winner == rpsMatch.p1{
            result = "Win!"
        } else {
            result = "Loss."
        }
        return result
    }
}
