//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by stanley phillips on 1/26/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Unable to reach the server."
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server could not retrieve any data."
        case .unableToDecode:
            return "Unable to retrieve photo."
        }
    }
}
