//
//  ShoppingCartRow.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 02.11.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct ShoppingCartRow: View {
    
    var product: Product
    
    var body: some View {
        HStack {
            product.image
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.body)
                Text(product.availableStatus)
                    .font(.body)
                    .foregroundColor(product.isAvailable ? Color.green : Color.red)
            }
            
            Spacer()
            
            Text("\(product.price)$")
                .font(.headline)
        }
    }
}

struct ShoppingCartRow_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartRow(product: productData[0])
    }
}
