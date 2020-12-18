//
//  ExpandingCellModel.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation
import IGListKit

final class ExpandingCellModel {
    
    let identifier: String
    let isExpanded: Bool
    let title: String
    let logo: UIImage
    
    init(identifier: String, isExpanded: Bool, title: String, logo: UIImage) {
        self.identifier = identifier
        self.isExpanded = isExpanded
        self.title = title
        self.logo = logo
    }
}

// MARK: - ListDiffable

extension ExpandingCellModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ExpandingCellModel else { return false }
        return identifier == object.identifier
    }
}
