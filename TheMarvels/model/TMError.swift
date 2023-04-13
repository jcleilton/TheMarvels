//
//  TMError.swift
//  TheMarvels
//
//  Created by Cleilton on 13/04/23.
//

import Foundation
import MarvelsApiCore

public enum TMError: Error {
    
    case noData
    case requestError
    case invalidURL
    case noInternet
    case unauthorizate
    case invalidJSON
    
    public var localizedDescription: String {
        switch self {
        case .noData:
            return ErrorKind.noData.localizedDescription
            
        case .requestError:
            return ErrorKind.requestError.localizedDescription
            
        case .invalidURL:
            return ErrorKind.invalidURL.localizedDescription
            
        case .noInternet:
            return ErrorKind.noInternet.localizedDescription
            
        case .unauthorizate:
            return ErrorKind.unauthorizate.localizedDescription
            
        case .invalidJSON:
            return ErrorKind.invalidJSON.localizedDescription
        }
    }
    
    static func parse(from errorKind: ErrorKind) -> TMError {
        switch errorKind {
        case .noData:
            return .noData
            
        case .requestError:
            return .requestError
            
        case .invalidURL:
            return .invalidURL
            
        case .noInternet:
            return .noInternet
            
        case .unauthorizate:
            return .unauthorizate
            
        case .invalidJSON:
            return .invalidJSON
        }
    }
}
