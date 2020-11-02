//
//  Home.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 31.10.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories: [String: [Product]] {
        Dictionary(
            grouping: hotProducts,
            by: { $0.category.rawValue }
        )
    }

    var hotProducts: [Product] {
        productData.filter { $0.isHotProduct }
    }
    
    @State var showingShoppingCart = false
    @EnvironmentObject var userData: UserData
    
    var shoppingCartButton: some View {
        Button(action: {
            self.showingShoppingCart.toggle()
        }) {
            Image(systemName: "cart")
                .imageScale(.large)
                .accessibility(label: Text("Shopping cart"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Image("home_image")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: ProductList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Hot Products"))
            .navigationBarItems(trailing: shoppingCartButton)
            .sheet(isPresented: $showingShoppingCart) {
                ShoppingCart()
                    .environmentObject(self.userData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
