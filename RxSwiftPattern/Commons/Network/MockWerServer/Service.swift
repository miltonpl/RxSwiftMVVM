//
//  Service.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import Foundation
import RxSwift
enum ServiceError: Error {
    case invalidPath
    case invalidData(String)
}

class Service: ServiceProtocol {
    func fetchJson<T: Codable>(forType type: T.Type, forResource name: String, ofType ext: String) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: name, ofType: ext) else {
                observer.onError(ServiceError.invalidPath)
                return Disposables.create {}
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let objects = try JSONDecoder().decode(type.self, from: data)
                observer.onNext(objects)
            } catch {
                observer.onError(ServiceError.invalidData("\(error)"))
            }
            return Disposables.create {}
        }
    }
}
