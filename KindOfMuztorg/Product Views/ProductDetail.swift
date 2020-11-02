//
//  ProductDetail.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 31.10.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct ProductDetail: View {
    
    @EnvironmentObject var userData: UserData
    
    var product: Product
    
    var productIndex: Int {
        userData.products.firstIndex(where: { $0.id == product.id })!
    }
    
    var body: some View {
        VStack {
            product.category.image
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .edgesIgnoringSafeArea(.top)
            
            CircleImage(image: product.image)
                .offset(x: 0, y: -260)
                .padding(.bottom, -260)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(product.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.products[self.productIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.products[self.productIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text(product.availableStatus)
                        .foregroundColor(product.isAvailable ? Color.green : Color.red)
                        .font(.subheadline)
                    Text("\(product.price)$")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Button(action: {
                        self.userData.basket.append(self.userData.products[self.productIndex])
                    }) {
                        Text("Add to shopping basket")
                            .padding([.top, .bottom], 12)
                            .padding([.leading, .trailing], 24)
                            .foregroundColor(Color.black)
                            .background(Color.yellow)
                            .cornerRadius(8)
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 260, height: 260)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ProductDetail(product: userData.products[0])
            .environmentObject(userData)
    }
}
