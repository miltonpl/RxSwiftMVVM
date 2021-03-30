//
//  ViewModelProtocol.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import Foundation
public protocol ViewModelProtocol: AnyObject {
    associatedtype Service
    associatedtype Element
    var cellModels: [Element] { get set }
    init(service: Service)

    var numberOfRows: Int { get }
    func cell(at index: Int) -> Element
    func clearResults()
}

extension ViewModelProtocol {
    
    var numberOfRows: Int {
        cellModels.count
    }

    func clearResults() {
        self.cellModels = []
    }
    
    func cell(at index: Int) -> Element {
        return self.cellModels[index]
    }
}
