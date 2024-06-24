//
//  OwnerView.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import SwiftUI

struct OwnerView: View {
    var owner: Owner
    
    init(owner: Owner) {
        self.owner = owner
    }
    
    var body: some View {
        HStack(spacing: 8) {
            if let url = owner.pictureURL {
                GenericImageView(urlString: url)
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipShape(.circle)
                    .shadow(radius: ViewSizes.xxSmall.rawValue)
            }
            
            VStack(alignment: .leading, spacing: ViewSizes.xxSmall.rawValue) {
                Text(owner.name ?? "")
                if let average = owner.rating?.average,
                   let count = owner.rating?.count {
                    RatingView(isFullRatingView: true,
                               average: average,
                               count: count)
                }
            }
            Spacer()
        }
        .frame(width: .infinity)
        .padding(12)
        .overlay(
            RoundedRectangle(cornerRadius: ViewSizes.small.rawValue)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

#Preview {
    OwnerView(owner: Owner(name: "Owner Owner",
                           pictureURL: "https://getaround-assets.gumlet.io/jobs/team/howard.jpg",
                           rating: Rating(average: 4.4,
                                          count: 32)))
}
