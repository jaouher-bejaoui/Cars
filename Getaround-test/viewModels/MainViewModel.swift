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
    private let apiService = APIService()
    private let baseURL = "https://raw.githubusercontent.com/drivy/jobs/master/mobile/api/cars.json"
    
    @Published var cars: [Car]?
        
        func fetchData() async {
            print("fetchData")
            guard let result: [Car] = await apiService.downloadData()
            else {
                print("error")
                return
            }
            cars = result
        }
}
