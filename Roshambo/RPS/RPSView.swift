//
//  ContentView.swift
//  Roshambo
//
//  Created by Lucas Lopes on 26/12/23.
//

import SwiftUI

struct RPSView: View {
    @ObservedObject private var rpsViewModel = RpsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {rpsViewModel.makeYourMove(RPS.paper)}){
                    Image("paper")
                }
                HStack{
                    Button(action: {rpsViewModel.makeYourMove(RPS.rock)}){
                        Image("rock")
                    }
                    Spacer()
                    Button(action: {rpsViewModel.makeYourMove(RPS.scissors)}){
                        Image("scissors")
                    }
                }
                Spacer()
                Text("Let's Play!")
                Spacer().frame(height: 20)
                NavigationLink(destination: HistoryView(matchesList: $rpsViewModel.history)) {
                    Text("See history")
                }
            }.frame(width: 250, height: 400)
                .padding().sheet(isPresented: $rpsViewModel.showingModal, content: {
                    ResultView(result: $rpsViewModel.matchResult)
                })
        }
    }
}

#Preview {
    RPSView()
}
