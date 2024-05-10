//
//  ProductModel.swift
//  andadorApp
//
//  Created by Isaias Albor on 4/5/24.
//

import SwiftUI

//Product model
struct Product: Identifiable{
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
    
}
//Sample products
var productList = [
    Product(name:"Flat White", category: "Coffee", image: "pic2", color: .brown,price: 4),
    Product(name:"Caffe Latte", category: "Coffee", image: "pic3",color: .brown,price: 2),
    Product(name:"Good Source", category: "Chocolate", image: "pic4",color: .brown,price: 2),
]
