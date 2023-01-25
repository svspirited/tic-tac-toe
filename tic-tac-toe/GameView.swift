//
//  ContentView.swift
//  tic-tac-toe
//
//  Created by Robert Place on 1/23/23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                                .onTapGesture {
                                    viewModel.processPlayerMove(for: i)
                                }
                        }
                    }
                    .padding(.bottom)
                    .disabled(viewModel.isBoardDisabled)
                    .alert(item: $viewModel.alertItem,
                           content: {
                        alertItem in Alert(title: alertItem.title,
                                           message: alertItem.message,
                                           dismissButton: .default(alertItem.buttonTitle,
                                                                   action: { viewModel.resetGame() }))
                    })
                }
                
                Spacer()
            }
        }
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.red).opacity(0.5)
            .frame(width: proxy.size.width/3 - 15,
                   height: proxy.size.width/3 - 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
