//
//  CartManager.swift
//  andadorApp
//
//  Created by Isaias Albor on 5/10/24.
//

import SwiftUI

class CartManager: ObservableObject{
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product){
        products.append(product)
        total += product.price
    }
    func removeFromCart(product: Product){
        products = products.filter { $0.id != product.id}
        total -= product.price
        
    }
}
