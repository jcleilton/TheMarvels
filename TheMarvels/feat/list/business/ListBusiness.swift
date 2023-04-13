//
//  ListBusiness.swift
//  TheMarvels
//
//  Created by Cleilton on 13/04/23.
//

import Foundation

final class ListBusiness {
    
    private let service: ListService
    
    var didFinish: (([HeroModel]) -> Void)?
    var onError: ((String) -> Void)?
    
    init(service: ListService = ListService()) {
        self.service = service
    }
    
    func fetch(value: String = String()) {
        service.didFinish = didFinish
        service.onError = onError
        service.fetch(value: value)
    }
}
