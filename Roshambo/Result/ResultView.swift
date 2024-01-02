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
    @ObservedObject var resultViewModel = ResultViewModel()
    
    @State private var animate = false
    
    var body: some View {
        
        VStack{
            Image(resultViewModel.imageForMatch(result)).opacity(animate ? 1.0 : 0.2)
            Text(resultViewModel.messageForMatch(result))
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
}

#Preview {
    ResultView(result: Binding.constant(RPSMatch(p1: RPS(), p2: RPS())))
}
