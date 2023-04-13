//
//  HeroModel.swift
//  TheMarvels
//
//  Created by Cleilton on 13/04/23.
//

import MarvelsApiCore
import UIKit

public class HeroModel {
    
    public let description: String?
    public var id: Int
    public let modified: String?
    public let name: String?
    public let resourceURI: String?
    public var image: UIImage?
    
    init(
        description: String?,
        id: Int,
        modified: String?,
        name: String?,
        resourceURI: String?
    ) {
        self.description = description
        self.id = id
        self.modified = modified
        self.name = name
        self.resourceURI = resourceURI
    }
    
    static func parse(from hero: Hero) -> HeroModel {
        var object = HeroModel(
            description: hero.description,
            id: hero.id,
            modified: hero.modified,
            name: hero.name,
            resourceURI: hero.resourceURI
        )
        
        DispatchQueue.main.async { [weak object, hero] in
            hero.getImage { image in
                guard let image = image else { return }
                object?.image = image
            }
        }
        
        return object
    }
}
