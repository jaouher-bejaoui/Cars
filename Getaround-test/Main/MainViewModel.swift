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
    
    @Published var isLoading: Bool = true
    @Published var cars: [Car]?
}

extension MainViewModel: MainViewModelProtocol {
    func fetchData() async {
        guard let result: [Car] = await webServices.downloadData()
        else {
            isLoading = false
            return
        }
        cars = result
        isLoading = false
    }
}
