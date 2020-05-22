//
//  Restaurant.swift
//  guuu
//
//  Created by Takumi Abe on 2020/05/22.
//  Copyright © 2020 Takumi Abe. All rights reserved.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var access: String
    var thumbnail: String  // URL
    var address: String
    var phoneNumber: String
    var openingTime: Date
    var image: String  // URL
}

