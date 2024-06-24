//
//  CarDetailsView.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import SwiftUI

struct CarDetailsView: View {
    @StateObject var viewModel: CarDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            GenericImageView(urlString: viewModel.car.pictureURL ?? "")
                .frame(width: .infinity)
                .scaledToFit()
                .shadow(radius: 2)
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(viewModel.car.brand ?? "") \(viewModel.car.model ?? "")")
                        .font(.title)
                        .bold()
                    RatingView(isFullRatingView: true,
                               average: viewModel.car.rating?.average ?? 0,
                               count: viewModel.car.rating?.count ?? 0)
                }
                Spacer()
                
                if let price = viewModel.car.pricePerDay {
                    PriceView(price: price)
                }
            }
            
            Text("Owner")
                .font(.title3)
                .bold()
                .padding(.top, 16)
            if let owner = viewModel.car.owner {
                OwnerView(owner: owner)
                    .frame(width: .infinity)
            }
            
            Spacer()
        }
        .padding(12)
    }
}
