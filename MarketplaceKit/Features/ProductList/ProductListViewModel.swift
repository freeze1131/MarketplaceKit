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

@MainActor
final class ProductListViewModel: ObservableObject {
    private var loadTask: Task<Void, Never>?
    private(set) var currentRequestID: UUID = UUID()
    @Published var state: ViewState = .idle
    
    init() {}
    
    func loadProducts() {
        
        loadTask?.cancel()
        loadTask = Task {
            
            state = .loading
            
            do {
                try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            } catch {
                return // task is cancelled, return
            }
            
            
            let products = [
                Product(id: 1, name: "iPhone 15", price: 64999),
                Product(id: 2, name: "MacBook Pro", price: 89999),
                Product(id: 3, name: "AirPods Pro", price: 12999)
            ]
            self.state = .success(products)
        }
    }
    
    func forceError() {
        loadTask?.cancel()
        state = .error("Forced error")
    }
}
