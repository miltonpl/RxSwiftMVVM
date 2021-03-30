//
//  SpyListViewModel.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//
import Foundation
import RxSwift

class SpyListViewModel: ViewModelProtocol {
    private var disposeBag = DisposeBag()
    var cellModels: [SpyModel] = []
    private let service: ServiceProtocol
    
    required init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchJson() {
        self.service.fetchJson(forType: SpiesData.self, forResource: "spies", ofType: "json")
            .subscribe(onNext: { spiesData in
                    self.cellModels = spiesData.spies
                }, onError: { error in
                    print("error - \(error)")
                })
            .disposed(by: self.disposeBag)
    }
}
