//
//  ProductList.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 31.10.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct ProductList: View {
    
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
            }
            
            ForEach(userData.products) { product in
                if !self.userData.showFavoritesOnly || product.isFavorite {
                    NavigationLink(
                        destination: ProductDetail(product: product)
                    ) {
                        ProductRow(product: product)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Products"))
    }
}
