//
//  ExpandingCell.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit
import IGListKit

class ExpandingCell: UICollectionViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var upDownImageView: UIImageView!
}

// MARK: - ListBindable

extension ExpandingCell: ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? ExpandingCellModel else { return }
        logoImageView.image = model.logo
        titleLable.text = model.title
        upDownImageView.image = model.isExpanded
            ? UIImage(named: "up")
            : UIImage(named: "down")
    }
}
