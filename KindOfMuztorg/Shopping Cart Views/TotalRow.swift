//
//  TotalRow.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 02.11.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct TotalRow: View {
    
    @EnvironmentObject var userData: UserData
    
    var totalPrice: Int {
        return self.userData.basket.reduce(0) { result, next -> Int in
            return result + next.price
        }
    }
    
    var body: some View {
        HStack {
            Text("Total: ")
                .font(.body)
            
            Spacer()
            
            Text("\(totalPrice)$")
                .font(.headline)
        }
        .padding()
    }
}

struct TotalRow_Previews: PreviewProvider {
    static var previews: some View {
        TotalRow().environmentObject(UserData())
    }
}
