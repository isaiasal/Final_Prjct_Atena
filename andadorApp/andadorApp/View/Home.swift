//
//  Home.swift
//  andadorApp
//
//  Created by Isaias Albor on 4/1/24.
//

import SwiftUI

struct Home: View {
    
    // Category view Properties
    
    @State var selectedCategory = "All"
    
    @EnvironmentObject var cartManager: CartManager
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    //Header
                    HStack{
                        Text("Café Atenea")
                            .font(.system(size:36))
                            .padding(.trailing)
                        Spacer()
                        
                       // Image(systemName: "line.3.horizontal")
                        Image(systemName: "lizard.circle.fill")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 60, height: 70)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4) )
                        
                    }
                    .padding(30)
                    //category List
                    CategoryListView
                    
                    //collection view
                    HStack{
                        Text("Coffee **Collection**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink{
                            CollectionView()
                                .environmentObject(cartManager)
                        }label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                  
                    
                    //product list
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(productList, id: \.id){ item in
                                ProductCard(product: item)
                                    .environmentObject(cartManager)
                                
                            }
                        }
                    }
                }
            }
        }
    }
     
    
    //Category LIst View
    var CategoryListView: some View{
        HStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                ForEach(categoryList, id: \.id) { item in
                    Button{
                        selectedCategory = item.title
                    }label:{
                        HStack{
                            if item.title != "All"{
                                Image(item.icon)
                                    .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                            }
                            Text(item.title)
                        }
                       }
                    .padding(20)
                    .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                    .foregroundColor(selectedCategory != item.title ? .black: .white )
                    .clipShape(Capsule())
                    
                    }
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
}

//Product Card view
struct ProductCard: View{
    
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View{
     
       
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -2)
                .rotationEffect(Angle(degrees: 10))
            
            VStack(alignment: .leading, content:{
                Text("\(product.name)")
                    .font(.system(size:28, weight: .semibold))
                    .frame(width:160)
                Text(product.category)
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                
                Spacer()
                HStack{
                    Text("$\(product.price).0")
                        .font(.system(size:26, weight: .semibold))
                 
                    Spacer()
                    
                    Button{
                        cartManager.addToCart(product: product)
                    }label:
                    {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 70, height: 68)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -10)
                }
                .padding(.leading)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.white.opacity(0.5))
                .clipShape(Capsule())
                
            })
    
            }
      
        .padding(40)
        .frame(width: 320, height: 442)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading , 15)
      }
}

