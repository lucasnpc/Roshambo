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
    
    var body: some View {
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
        }.frame(width: 250, height: 400)
            .padding().sheet(isPresented: $showingModal, content: {
                ResultView(result: $matchResult)
            })
    }
    
    func makeYourMove(_ playersMove: RPS){
        let computersMove = RPS()
        
        matchResult = RPSMatch(p1: playersMove, p2: computersMove)
        showingModal = true
    }
}

#Preview {
    RPSView()
}
