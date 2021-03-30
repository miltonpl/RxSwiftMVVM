//
//  ServiceProtocol.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import Foundation
import RxSwift
public protocol ServiceProtocol {
    func fetchJson<T: Codable>(forType type: T.Type, forResource name: String, ofType ext: String) -> Observable<T>
}
