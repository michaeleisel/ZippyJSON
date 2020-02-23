//
//  user.swift
//  ZipPhone
//
//  Created by Michael Eisel on 2/22/20.
//  Copyright © 2020 Michael Eisel. All rights reserved.
//

import Foundation

struct User2: Decodable, Equatable {
    let firstName: String
    let lastName: String
    let email: String
    let login: String
    let passwordHash: String
    let gender: String
    let avatarUrl: String
    let country: String
    let city: String
    let zipCode: Int
    let phone: String
    let isVip: Bool
    let isFamous: Bool
}
