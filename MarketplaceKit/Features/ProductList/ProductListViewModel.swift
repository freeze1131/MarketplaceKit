//
//  ProductListViewModel.swift
//  MarketplaceKit
//
//  Created by Ahmet Ozen on 6.01.2026.
//

import Foundation
internal import Combine


enum ViewState {
    case loading, success([Product]), error(String), idle
}

final class ProductListViewModel: ObservableObject {
    private(set) var currentRequestID: UUID = UUID()
    @Published var state: ViewState = .idle
    
    init() {}
    
    func loadProducts() {
        let loadRequestID = UUID()
        self.currentRequestID = loadRequestID
        if case .loading = state {
            return
        }
        
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let products = [
                Product(id: 1, name: "iPhone 15", price: 64999),
                Product(id: 2, name: "MacBook Pro", price: 89999),
                Product(id: 3, name: "AirPods Pro", price: 12999)
            ]
            if loadRequestID == self.currentRequestID {
                self.state = .success(products)
            }
        }
    }
        
    func forceError() {
        currentRequestID = UUID()
        state = .error("Forced error")
    }
}
