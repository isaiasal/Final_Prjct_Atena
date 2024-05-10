//
//  CartView.swift
//  andadorApp
//
//  Created by Isaias Albor on 4/8/24.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManageR: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("Cart")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        Spacer()
                        
                        Button{
                            mode.wrappedValue.dismiss()
                        }label: {
                            
                            Text("3")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(.brown.opacity(0.5))
                                .clipShape(Capsule())
                            
                            
                            
                        
                        }
                        .foregroundColor(.black)
                        Button{
                            mode.wrappedValue.dismiss()
                        }label:{
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width:70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    
                    
                    //Products in the cart
                    ForEach(productList){item in
                            CartProductCard(product: item)
                    }
                    //Total amount
                    
                    // Button to payment
                }
                .padding(.horizontal)
                
                //card Total
                VStack (alignment: .leading){
                    HStack{
                        Text("Amount")
                        Spacer()
                        Text("$8.00")
                            .font(.system(size: 24, weight: .semibold))
                    }
                    Divider()
                    
                    Text("Total Amount")
                        .font(.system(size: 24, weight: .semibold))
                    Text("USD 8.99")
                        .font(.system(size: 34, weight: .semibold))
                    
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(12))
                .clipShape(.rect(cornerRadius: 30))
                .padding()
                
                //buttons
                Button{
                    
                }label:{
                    Text("Make Payment")
                        .frame(maxWidth: .infinity)
                        .background(.brown.opacity(0.6))
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .padding()
                }
            }
        }
    }
}

#Preview {
    CartView()
    
        .environmentObject(CartManager())
    
}
//Cart product view
struct CartProductCard: View{
    
    var product: Product
    
    var body: some View{
        HStack (alignment: .center, spacing:20)
        {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
                
            })
            Spacer()
            
            Text("$\(product.price)")
                .padding()
                .background(.brown.opacity(0.5))
                .clipShape(Capsule())
        }
    }
}
