//
//  CategoryRow.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 31.10.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Product]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { product in
                        NavigationLink(
                            destination: ProductDetail(
                                product: product
                            )
                        ) {
                            CategoryItem(product: product)
                        }
                    }
                }
            }
            .frame(height: 200)
        }
    }
}

struct CategoryItem: View {
    var product: Product
    var body: some View {
        VStack(alignment: .leading) {
            product.image
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(product.name)
                .foregroundColor(.primary)
                .font(.caption)
            Text(product.availableStatus)
                .foregroundColor(product.isAvailable ? Color.green : Color.red)
                .font(.caption)
            Text("\(product.price)$")
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
        .padding(.bottom, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: productData[0].category.rawValue,
            items: Array(productData.prefix(4))
        )
        .environmentObject(UserData())
    }
}
