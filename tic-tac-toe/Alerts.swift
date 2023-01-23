//
//  Alerts.swift
//  tic-tac-toe
//
//  Created by Robert Place on 1/24/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win!"),
                             message: Text("Smarty Pants"),
                             buttonTitle: Text("Play Again"))
    static let computerWin = AlertItem(title: Text("AI Beat You"),
                             message: Text("Not so smart"),
                             buttonTitle: Text("Play Again"))
    static let draw = AlertItem(title: Text("Tie!"),
                             message: Text("Try again"),
                             buttonTitle: Text("Play Again"))
    
}
