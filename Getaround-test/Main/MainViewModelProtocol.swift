//
//  MainViewModelProtocol.swift
//  Getaround-test
//
//  Created by Jaouher  on 22/07/2024.
//

import Foundation

protocol MainViewModelProtocol {
    var isLoading: Bool { get set }
    var cars: [Car]? { get set }
    
    func fetchData() async throws
}
