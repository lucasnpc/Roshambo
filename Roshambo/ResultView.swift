//
//  RPSMatch.swift
//  Roshambo
//
//  Created by Lucas Lopes on 26/12/23.
//

import SwiftUI

struct ResultView: View {
    @Binding var result: RPSMatch?
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        Text(result?.p1.description ?? "fck")
        
//        if result.p1 == result.p2 {
//            Text("It's a tie!")
//        }
        
        Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
            Text("Play Again")
        })
    }
}

#Preview {
    ResultView(result: Binding.constant(RPSMatch(p1: RPS(), p2: RPS())))
}
