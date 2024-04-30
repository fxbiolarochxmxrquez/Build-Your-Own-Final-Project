//
//  ContentView.swift
//  Build Your Own Final Project
//
//  Created by Fabiola Rocha Marquez on 4/12/24.
//

// Keila's comment
// Ariya's comment

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.opacity(0.9).ignoresSafeArea()
                VStack {
                    VStack {
                        Text("Find Your Match!")
                            .font(Font.custom("Marker Felt", size: 35))
                        Image("memory")
                            .resizable()
                            .frame(width: 170, height: 150)
                            .cornerRadius(20)
                    }
                    NavigationLink {
                        GridOptions()
                    } label: {
                        CustomButton(text: "Play")
                            .cornerRadius(25)
                            .shadow(radius: 20)
                    }
                }
            }
        }
    }
}

struct CustomButton: View {
    var text: String
    var background: Color = .yellow
    var body: some View {
        Text(text)
            .foregroundColor(.blue)
            .padding()
            .padding(.horizontal)
            .background(background)
            .shadow(radius: 10)
    }
}

#Preview {
    ContentView()
}
