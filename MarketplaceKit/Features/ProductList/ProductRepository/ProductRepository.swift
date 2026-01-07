//
//  ProductRepository.swift
//  MarketplaceKit
//
//  Created by Ahmet Ozen on 8.01.2026.
//

import Foundation


class ProductRepository {

    let products = [
        Product(id: 1, name: "iPhone 15", price: 64999),
        Product(id: 2, name: "MacBook Pro", price: 89999),
        Product(id: 3, name: "AirPods Pro", price: 12999)
    ]
    
    func loadProducts() async throws -> [Product] {
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        return products
    }
}
