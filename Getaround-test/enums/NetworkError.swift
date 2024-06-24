//
//  NetworkError.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

