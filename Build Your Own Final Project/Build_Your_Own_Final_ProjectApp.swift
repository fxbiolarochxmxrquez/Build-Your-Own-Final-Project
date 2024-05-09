//
//  Build_Your_Own_Final_ProjectApp.swift
//  Build Your Own Final Project
//
//  Created by Fabiola Rocha Marquez on 4/12/24.
//

import SwiftUI

@main
struct Build_Your_Own_Final_ProjectApp: App {
    @StateObject var game = CardMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: game)
        }
    }
}
