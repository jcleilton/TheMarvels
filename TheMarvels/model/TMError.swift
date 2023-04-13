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
            return "Sem dados"
        case .requestError:
            return "Erro na requisição"
        case .invalidURL:
            return "URL inválida"
        case .noInternet:
            return "Sem internet"
        case .unauthorizate:
            return "Acesso negado"
        case .invalidJSON:
            return "Erro na conversão dos dados"
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
