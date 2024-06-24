//
//  PriceView.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import SwiftUI

struct PriceView: View {
    var price: Int
    var numberOfDays: Int = 7
    
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
                RoundedRectangle(cornerRadius: ViewSizes.small.rawValue)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            )
            
            Image(systemName: "info.circle.fill")
                .foregroundColor(.purple)
                .padding(-ViewSizes.small.rawValue)
        }
    }
}

#Preview {
    PriceView(price: 23)
}
