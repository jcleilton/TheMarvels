//
//  ListService.swift
//  TheMarvels
//
//  Created by Cleilton on 13/04/23.
//

import Foundation

final class ListService {
    
    private let provider: ApiProviderProtocol
    
    var didFinish: (([HeroModel]) -> Void)?
    var onError: ((String) -> Void)?
    
    init(provider: ApiProviderProtocol = ApiProvider.make()) {
        self.provider = provider
    }
    
    func fetch(value: String = String()) {
        provider.fetchData(with: value) { [weak self] result in
            switch result {
            case .success(let heroes):
                self?.didFinish?(heroes)
                
            case .failure(let error):
                self?.onError?(error.localizedDescription)
            }
        }
    }
    
}
