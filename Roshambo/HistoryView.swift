//
//  HistoryView.swift
//  Roshambo
//
//  Created by Lucas Lopes on 28/12/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var matchesList: [RPSMatch]
    
    var body: some View {
        Table(matchesList) {
            TableColumn("MatchInfo") { match in
                HStack {
                    Text(matchInfo(rpsMatch:match))
                    Spacer()
                    Text("\(match.p1.description) vs \(match.p2.description)")
                }
            }
        }
    }
    
    private func matchInfo(rpsMatch: RPSMatch) -> String{
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

#Preview {
    HistoryView(matchesList: Binding.constant([
        RPSMatch(p1: RPS(), p2: RPS()),
        RPSMatch(p1: RPS(), p2: RPS()),
        RPSMatch(p1: RPS(), p2: RPS()),
        RPSMatch(p1: RPS(), p2: RPS())
    ])
    )
}
