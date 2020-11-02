//
//  ShoppingCart.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 02.11.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct ShoppingCart: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.userData.basket, id: \.self) { item in
                        ShoppingCartRow(product: item)
                    }
                    .onDelete(perform: self.deleteRow)
                }
                .navigationBarTitle(Text("Shopping cart"), displayMode: .inline)
                
                Spacer()
                
                TotalRow()
                    .environmentObject(self.userData)
            }
        }
    }
    
    private func deleteRow(at indexSet: IndexSet) {
        self.userData.basket.remove(atOffsets: indexSet)
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart().environmentObject(UserData())
    }
}
