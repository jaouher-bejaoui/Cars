//
//  MainView.swift.swift
//  Getaround-test
//
//  Created by Jaouher  on 20/06/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            if let cars = viewModel.cars {
                List {
                    ForEach(cars) { car in
                        ZStack {
                            listItem(car: car)
                            NavigationLink(destination: CarDetailsView(viewModel: CarDetailsViewModel(car: car))) {
                                EmptyView()
                            }
                            .opacity(0)

                            
                        }
                        
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.white)
                            .padding(4)
                    )
                }
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
                .listStyle(.plain)
                .padding(8)
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
            GenericImageView(urlString: car.pictureURL ?? "")
                .scaledToFill()
                .padding(.top, 4)
            
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
        .padding(8)
    }
}

#Preview {
    MainView()
}
