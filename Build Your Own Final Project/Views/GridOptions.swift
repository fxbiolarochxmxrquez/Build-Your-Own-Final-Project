//
//  GridOptions.swift
//  Build Your Own Final Project
//
//  Created by Keila Islas on 4/24/24.
//

import SwiftUI

struct GridOptions: View {
    var body: some View {
        ZStack {
            Color.red.opacity(0.9).ignoresSafeArea()
            VStack {
                VStack {
                    Text("Pick Your Size")
                        .font(Font.custom("Marker Felt", size: 35))
                    
                }
                NavigationLink {
                    GameView(viewModel: CardMemoryGame())
                } label: {
                    CustomButton(text: "4x4")
                        .cornerRadius(25)
                        .shadow(radius: 20)
                }
            }
        }
    }
}

#Preview {
    GridOptions()
}
