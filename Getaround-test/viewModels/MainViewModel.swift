//
//  MainViewModel.swift
//  Getaround-test
//
//  Created by Jaouher  on 20/06/2024.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let webServices = WebServices()
    private let baseURL = "https://raw.githubusercontent.com/drivy/jobs/master/mobile/api/cars.json"
    
    @Published var cars: [Car]?
    
    @MainActor func fetchData() async {
        print("fetchData")
        guard let result: [Car] = await webServices.downloadData()
        else {
            print("error")
            return
        }
        cars = result
    }
    
    func isFavorite(car: Car, favorites: [Favorites]) -> Bool {
        favorites.contains(where: { $0.carId == car.id })
    }
}
