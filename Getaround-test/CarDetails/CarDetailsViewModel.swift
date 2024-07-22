//
//  CarDetailsViewModel.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import Foundation

class CarDetailsViewModel: ObservableObject, CarDetailsViewModelProtocol {
    @Published var car: Car
    
    init(car: Car) {
        self.car = car
    }
}
