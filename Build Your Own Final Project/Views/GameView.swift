//
//  GameView.swift
//  Build Your Own Final Project
//
//  Created by Keila Islas on 4/22/24.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.7)
                    .ignoresSafeArea()
                Text("4x4")
            }
        }
        
    }
}

#Preview {
    GameView()
}
