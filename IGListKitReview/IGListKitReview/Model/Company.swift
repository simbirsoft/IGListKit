//
//  Company.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation
import IGListKit

final class Company {
    
    let id: String
    let title: String
    let logo: UIImage
    let logoSymbol: UIImage
    var isExpanded: Bool = false
    
    init(id: String, title: String, logo: UIImage, logoSymbol: UIImage) {
        self.id = id
        self.title = title
        self.logo = logo
        self.logoSymbol = logoSymbol
    }
}

// MARK: ListDiffable

extension Company: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Company else { return false }
        return id == object.id
    }
}
