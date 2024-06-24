//
//  PriceView.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import SwiftUI

struct PriceView: View {
    var price: Int
    var numberOfDays: Int = Int.random(in: 2..<15)
    
    init(price: Int) {
        self.price = price*numberOfDays
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Text("\(price)€")
                    .font(.title)
                    .bold()
                Text("for \(numberOfDays) days")
                    .font(.footnote)
            }
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            )
            Image(systemName: "info.circle.fill")
                .foregroundColor(.purple)
                .padding(-8)
        }
    }
    
}

#Preview {
    PriceView(price: 23)
}
