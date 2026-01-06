//
//  ProductListViewModel.swift
//  MarketplaceKit
//
//  Created by Ahmet Ozen on 6.01.2026.
//

import Foundation
internal import Combine


enum ViewState {
    case loading, success, error, idle
}

final class ProductListViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published var state: ViewState = .idle
    
    init() {}
    
    func loadProducts() {
        guard state != .loading else { return }
        
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.products = [
                Product(id: 1, name: "iPhone 15", price: 64999),
                Product(id: 2, name: "MacBook Pro", price: 89999),
                Product(id: 3, name: "AirPods Pro", price: 12999)
            ]
            self.state = .success
        }
    }
}
