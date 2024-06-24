//
//  CarDetailsView.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import SwiftUI

struct CarDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    @StateObject var viewModel: CarDetailsViewModel
    
    @FetchRequest(
        entity: Favorites.entity(),
        sortDescriptors: [NSSortDescriptor(key: "carId", ascending: true)]
    ) var items: FetchedResults<Favorites>
    
    var body: some View {
        VStack(alignment: .leading) {
            GenericImageView(urlString: viewModel.car.pictureURL ?? "")
                .frame(maxWidth: .infinity)
                .scaledToFit()
                .shadow(radius: ViewSizes.xxSmall.rawValue)
            HStack {
                VStack(alignment: .leading, spacing: ViewSizes.xSmall.rawValue) {
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
                .padding(.top, ViewSizes.xxLarge.rawValue)
            if let owner = viewModel.car.owner {
                OwnerView(owner: owner)
                    .frame(maxWidth: .infinity)
            }
            Spacer()
        }
        .padding(12)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.purple)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    addOrRemoveToFavorite()
                } label: {
                    FavoriteImage(isLiked: isExists())
                }
            }
            
        }
    }
}

// MARK: Core Data Operations
extension CarDetailsView {
    func addOrRemoveToFavorite() {
        if isExists() {
            // if the carId exists in Favorites DB => delete it
            guard let itemToDelete = items.first(where: {
                $0.carId == viewModel.car.id
            }) else {
                return
            }
            moc.delete(itemToDelete)
        } else {
            // else, add it to DB
            let favorite = Favorites(context: moc)
            favorite.carId = viewModel.car.id
        }
        do {
            try self.moc.save()
        } catch {
            print("whoops \(error.localizedDescription)")
        }
    }
    
    func isExists() -> Bool {
        items.contains(where: { $0.carId == viewModel.car.id })
    }
}
