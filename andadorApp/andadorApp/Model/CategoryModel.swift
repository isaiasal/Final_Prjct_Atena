//
//  CategoryModel.swift
//  andadorApp
//
//  Created by Isaias Albor on 4/1/24.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable{
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title:"All"),
    CategoryModel(icon: "Choco", title: "Choco"),
    CategoryModel(icon: "Salads", title: "salad"),
    CategoryModel(icon: "", title: ""),



]
