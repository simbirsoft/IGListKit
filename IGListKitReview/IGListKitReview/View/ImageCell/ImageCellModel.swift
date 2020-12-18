//
//  ImageCellModel.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation
import IGListKit

final class ImageCellModel {
    
    let identifier: String
    let logo: UIImage
    
    init(logo: UIImage) {
        self.identifier = UUID().description
        self.logo = logo
    }
}

// MARK: - ListDiffable

extension ImageCellModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ImageCellModel else { return false }
        return identifier == object.identifier
    }
}
