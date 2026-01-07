//
//  MockRepository.swift
//  MarketplaceKit
//
//  Created by Ahmet Ozen on 8.01.2026.
//

import Foundation

class MockRepository: ProductRepositoryProtocol {
    
    var shouldReturnError = false
    
    
    func loadProducts() async throws -> [Product] {
        if shouldReturnError {
            throw NSError(domain: "test", code: 1)
        }
        
        return [
            Product(id: 1, name: "iPhone 15", price: 64999),
            Product(id: 2, name: "MacBook Pro", price: 89999),
            Product(id: 3, name: "AirPods Pro", price: 12999),
            Product(id: 4, name: "iPad Pro", price: 79999),
            Product(id: 5, name: "Apple Watch Series 9", price: 49999),
            Product(id: 6, name: "Acoman", price: 1111111)
        ]
    }
}
