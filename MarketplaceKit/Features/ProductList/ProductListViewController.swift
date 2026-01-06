//
//  ProductListViewController.swift
//  MarketplaceKit
//
//  Created by Ahmet Ozen on 6.01.2026.
//

import UIKit
import SwiftUI

final class ProductListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vm = ProductListViewModel()
        let productListView = ProductListView(vm: vm)

        view.backgroundColor = .systemBackground
        title = "Products"
        
        let hostingController = UIHostingController(rootView: productListView)
        
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
        
    }
}

