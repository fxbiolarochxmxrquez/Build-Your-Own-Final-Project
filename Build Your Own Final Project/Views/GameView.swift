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
                VStack {
                    Text("4x4")
                        .font(Font.custom("Marker Felt", size: 35))
                    Text("Disney Characters")
                        .font(Font.custom("Marker Felt", size: 20))
                }
            }
        }
    }
}

#Preview {
    GameView()
}
