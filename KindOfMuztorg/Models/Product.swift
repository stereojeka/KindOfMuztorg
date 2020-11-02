//
//  Product.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 31.10.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import SwiftUI

struct Product: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var category: Category
    var price: Int
    var isAvailable: Bool
    var isFavorite: Bool
    var isHotProduct: Bool
    fileprivate var imageName: String
    
    var hotProductImage: Image? {
        guard isHotProduct else { return nil }
        
        return Image(
            ImageStore.loadImage(name: imageName),
            scale: 2,
            label: Text(name))
    }
    
    var availableStatus: String {
        return isAvailable ? "In Stock" : "On Request"
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case electricGuitars = "Electric guitars"
        case acousticGuitars = "Acoustic guitars"
        case electricDrums = "Electric drums"
        case acousticDrums = "Acoustic drums"
        
        var image: Image {
            switch self {
            case .acousticGuitars:
                return Image("category_acoustic")
            case .electricGuitars:
                return Image("category_guitar")
            case .acousticDrums:
                return Image("category_drums")
            case .electricDrums:
                return Image("category_drums2")
            }
        }
    }
}

extension Product {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

