//
//  ProductRepositoryProtocol.swift
//  MarketplaceKit
//
//  Created by Ahmet Ozen on 8.01.2026.
//

import Foundation
    

protocol ProductRepositoryProtocol {
    func loadProducts() async throws -> [Product]
}

