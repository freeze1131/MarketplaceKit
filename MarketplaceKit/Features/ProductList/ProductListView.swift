//
//  ProductListView.swift
//  MarketplaceKit
//
//  Created by Ahmet Ozen on 6.01.2026.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var vm: ProductListViewModel
    
    var body: some View {
        Group {
            switch vm.state {
            case .idle:
                Color.clear
            case .loading:
                ProgressView("Loading...")
            case .success:
                List(vm.products) { product in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.name)
                            .font(.headline)
                        
                        Text("\(product.price)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                }
            case .error:
                Text("Error loading products")
                
            }
        }.task{
            vm.loadProducts()
        }
        
    }
}

//#Preview {
//    ProductListView( products: [Product])
//}
