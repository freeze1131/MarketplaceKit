//
//  ProductListViewController.swift
//  MarketplaceKit
//
//  Created by Ahmet Ozen on 6.01.2026.
//

import UIKit
import SwiftUI

final class ProductListViewController: UIViewController {
    
    let vm = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productListView = ProductListView(vm: vm)
        
        setupNavigationBar()
        
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
    
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.clockwise"),
            style: .plain,
            target: self,
            action: #selector(retryButtonTapped)
        )
        
        let leftButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.2.circlepath.circle"),
            style: .plain,
            target: self,
            action: #selector(forceErrorButtonTapped)
        )
        navigationItem.leftBarButtonItem = leftButton
        
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func forceErrorButtonTapped () {
        vm.forceError()
    }
    
    
    @objc private func retryButtonTapped() {
        vm.loadProducts()
    }
}

