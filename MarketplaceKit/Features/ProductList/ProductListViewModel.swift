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
    @Published var state: ViewState = .idle
    let productRepository: ProductRepositoryProtocol
    
    init(productProtocol: ProductRepositoryProtocol) {
        self.productRepository = productProtocol
    }
    
    func loadProducts()  {
        loadTask?.cancel()
        self.state = .loading
        loadTask = Task {
            do {
                let products = try await productRepository.loadProducts()
                self.state = .success(products)
            } catch {
                self.state = .error("xd")
            }
        }
    }
    
    func forceError() {
        loadTask?.cancel()
        self.state = .error("Forced error")
    }
}
