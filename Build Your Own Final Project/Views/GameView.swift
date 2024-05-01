//
//  GameView.swift
//  Build Your Own Final Project
//
//  Created by Keila Islas on 4/22/24.
//

import SwiftUI

struct GameView: View {
    @State var isFaceUp = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.opacity(0.9).ignoresSafeArea()
                VStack {
                    Text("4x4")
                        .font(Font.custom("Marker Felt", size: 35))
                    Text("Disney Characters")
                        .font(Font.custom("Marker Felt", size: 20))
                    Spacer()
                    HStack {
                        if isFaceUp {
                            ZStack(content: {
                                RoundedRectangle(cornerRadius: 12)
                                Image("mickey").resizable().cornerRadius(12)
                            })
                            ZStack(content: {
                                RoundedRectangle(cornerRadius: 12)
                                Image("mickey").resizable().cornerRadius(12)
                            })
                            ZStack(content: {
                                RoundedRectangle(cornerRadius: 12)
                                Image("mickey").resizable().cornerRadius(12)
                            })
                            ZStack(content: {
                                RoundedRectangle(cornerRadius: 12)
                                Image("mickey").resizable().cornerRadius(12)
                            })
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GameView()
}

