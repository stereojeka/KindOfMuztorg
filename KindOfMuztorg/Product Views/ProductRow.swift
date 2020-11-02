//
//  ProductRow.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 31.10.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
    
    var product: Product
    
    var body: some View {
        HStack {
            product.image
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            Text(product.name)
            Spacer()

            if product.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}
