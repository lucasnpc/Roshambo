//
//  ContentView.swift
//  Roshambo
//
//  Created by Lucas Lopes on 26/12/23.
//

import SwiftUI

struct RPSView: View {
    @State private var showingModal = false
    @State private var matchResult: RPSMatch?
    @State private var history = [RPSMatch]()
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {makeYourMove(RPS.paper)}){
                    Image("paper")
                }
                HStack{
                    Button(action: {makeYourMove(RPS.rock)}){
                        Image("rock")
                    }
                    Spacer()
                    Button(action: {makeYourMove(RPS.scissors)}){
                        Image("scissors")
                    }
                }
                Spacer()
                Text("Let's Play!")
                Spacer().frame(height: 20)
                NavigationLink(destination: HistoryView(matchesList: $history)) {
                    Text("See history")
                }
            }.frame(width: 250, height: 400)
                .padding().sheet(isPresented: $showingModal, content: {
                    ResultView(result: $matchResult)
                })
        }
    }
    
    func makeYourMove(_ playersMove: RPS){
        let computersMove = RPS()
        let match = RPSMatch(p1: playersMove, p2: computersMove)
        
        matchResult = match
        history.append(match)
        showingModal = true
    }
}

#Preview {
    RPSView()
}
