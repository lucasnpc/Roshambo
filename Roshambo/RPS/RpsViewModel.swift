//
//  RpsViewModel.swift
//  Roshambo
//
//  Created by Lucas Lopes on 03/01/24.
//

import Foundation

class RpsViewModel: ObservableObject{
    @Published var showingModal = false
    @Published var matchResult: RPSMatch?
    @Published var history = [RPSMatch]()
    
    func makeYourMove(_ playersMove: RPS){
        let computersMove = RPS()
        let match = RPSMatch(p1: playersMove, p2: computersMove)
        
        matchResult = match
        history.append(match)
        showingModal = true
    }
}
