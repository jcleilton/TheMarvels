//
//  ListViewModel.swift
//  TheMarvels
//
//  Created by Cleilton on 13/04/23.
//

import Foundation

final class ListViewModel {
    
    private let business: ListBusiness
    var didFinish: (([HeroModel]) -> Void)?
    var onError: ((String) -> Void)?
    
    init(business: ListBusiness = ListBusiness()) {
        self.business = business
    }
    
    func fetch(value: String = String()) {
        business.didFinish = didFinish
        business.onError = onError
        business.fetch(value: value)
    }
    
}
