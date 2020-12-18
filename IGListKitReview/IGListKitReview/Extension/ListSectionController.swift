//
//  ListSectionController.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation
import IGListKit

extension ListSectionController {
    
    func dequeueXibCell<CellType>(for index: Int) -> CellType where CellType: UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(
            withNibName: String(describing: CellType.self),
            bundle: Bundle(for: CellType.self),
            for: self,
            at: index
        )
        
        guard let neededCell = cell as? CellType
        else {
            assertionFailure("Cell not created")
            return CellType()
        }
        return neededCell
    }
    
    // MARK: - Binding
    
    func bindXibCell<A: UICollectionViewCell & ListBindable>(_ cellModel: Any, index: Int) -> A {
        let cell: A = dequeueXibCell(for: index)
        cell.bindViewModel(cellModel)
        return cell
    }
}
