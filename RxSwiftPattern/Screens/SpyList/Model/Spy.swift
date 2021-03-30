//
//  Spy.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import Foundation

struct SpiesData: Codable {
    var spies: [SpyModel]
}

struct SpyModel: Codable {
    var age: Int8
    var gender: Gender
    var isIncognito: Bool
    var name: String
    var password: String
}

public enum Gender: String, Codable {
    case female
    case male
}
