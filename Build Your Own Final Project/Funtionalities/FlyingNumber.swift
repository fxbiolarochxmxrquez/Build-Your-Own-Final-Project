//
//  FlyingNumber.swift
//  Build Your Own Final Project
//
//  Created by Fabiola Rocha Marquez on 5/22/24.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
