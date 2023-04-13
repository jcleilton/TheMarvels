//
//  ApiProvider.swift
//  TheMarvels
//
//  Created by Cleilton on 13/04/23.
//

import Foundation
import MarvelsApiCore

protocol ApiProviderProtocol: AnyObject {
    static func make() -> ApiProvider
    func fetchData(with value: String, callback: @escaping (Result<[HeroModel], TMError>) -> Void)
}

public final class ApiProvider: ApiProviderProtocol {
    
    private let requestManager: RequestManager
    
    private init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }

    static func make() -> ApiProvider {
        .init(requestManager: RequestManager())
    }
    
    public func fetchData(
        with value: String,
        callback: @escaping (Result<[HeroModel], TMError>) -> Void
    ) {
        requestManager.fecthData(with: value) { result in
            switch result {
            case .success(let heroes):
                callback(.success(heroes.compactMap { HeroModel.parse(from: $0) }))
                
            case .failure(let error):
                callback(.failure(TMError.parse(from: error)))
            }
        }
    }
}
