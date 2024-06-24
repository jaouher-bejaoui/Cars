//
//  MainView.swift.swift
//  Getaround-test
//
//  Created by Jaouher  on 20/06/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationView {
            if let cars = viewModel.cars {
                List {
                    ForEach(cars) { car in
                        //NavigationLink(destination: colorCard.theme.mainColor) {
                            listItem(car: car)
                        //}
                        
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.white)
                            .padding(8)
                    )
                }
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
                .listStyle(.plain)
                .padding(4)
            }
            else {
                EmptyView()
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchData()
            }
        }
    }
}

extension MainView {
    
    @ViewBuilder
    func listItem(car: Car) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            CarImageView(urlString: car.pictureURL ?? "")
            
            HStack(alignment: .top) {
                Text("\(car.brand ?? "") \(car.model ?? "")")
                    .bold()
                Spacer()
                RatingView(isFullRatingView: false,
                           average: car.rating?.average ?? 0,
                           count: car.rating?.count ?? 0)
            }
            Text("**\(car.pricePerDay ?? 0)€** per day")
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    MainView()
}
