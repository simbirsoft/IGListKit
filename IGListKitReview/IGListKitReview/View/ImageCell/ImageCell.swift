//
//  ImageCell.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit
import IGListKit

class ImageCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!

}

// MARK: - ListBindable

extension ImageCell: ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? ImageCellModel else { return }
        imageView.image = model.logo
    }
}
