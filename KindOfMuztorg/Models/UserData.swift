//
//  UserData.swift
//  KindOfMuztorg
//
//  Created by Евгений Нименко on 31.10.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var products = productData
    @Published var basket = [Product]()
    //@Published var profile = Profile.default
}
