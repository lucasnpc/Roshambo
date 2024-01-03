//
//  HistoryView.swift
//  Roshambo
//
//  Created by Lucas Lopes on 28/12/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var matchesList: [RPSMatch]
    @ObservedObject var historyViewModel = HistoryViewModel()
    
    var body: some View {
        Table(matchesList) {
            TableColumn("MatchInfo") { match in
                HStack {
                    Text(historyViewModel.matchInfo(rpsMatch:match))
                    Spacer()
                    Text("\(match.p1.description) vs \(match.p2.description)")
                }
            }
        }
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
