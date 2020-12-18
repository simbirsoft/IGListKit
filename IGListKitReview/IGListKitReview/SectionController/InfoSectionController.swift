//
//  InfoSectionController.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation
import IGListKit


protocol InfoSectionControllerDelegate: class {
    
    func sectionControllerDidTapField(_ field: ExpandingCellModel)
}

final class InfoSectionController: ListBindingSectionController<ListDiffable> {
    
    weak var delegate: InfoSectionControllerDelegate?
    
    override init() {
        super.init()
        
        dataSource = self
        selectionDelegate = self
    }
}

extension InfoSectionController: ListBindingSectionControllerDataSource {
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let sectionModel = object as? InfoSectionModel else {
            return []
        }
        
        var models = [ListDiffable]()
        
        for item in sectionModel.companies {
            models.append(
                ExpandingCellModel(
                    identifier: item.id,
                    isExpanded: item.isExpanded,
                    title: item.title,
                    logo: item.logoSymbol
                )
            )
            
            if item.isExpanded {
                models.append(
                    ImageCellModel(logo: item.logo)
                )
            }
        }
        
        return models
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {

        let cell = self.cell(for: viewModel, at: index)
        return cell
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        var height: CGFloat
        switch viewModel {
        case is ExpandingCellModel:
            height = 60
        case is ImageCellModel:
            height = 70
        default:
            height = 0
        }
        
        return CGSize(width: width, height: height)
    }
}

extension InfoSectionController {
    
    private func cell(for viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        switch viewModel {
        case let cellModel as ExpandingCellModel:
            return bindXibCell(cellModel, index: index) as ExpandingCell
        case let cellModel as ImageCellModel:
            return bindXibCell(cellModel, index: index) as ImageCell
        default:
            assertionFailure("Wrong model passed")
            return bindXibCell(viewModel, index: index) as DefaultCell
        }
    }
}

extension InfoSectionController: ListBindingSectionControllerSelectionDelegate {
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, didSelectItemAt index: Int, viewModel: Any) {
        guard let cellModel = viewModel as? ExpandingCellModel
        else {
            return
        }
        
        delegate?.sectionControllerDidTapField(cellModel)
    }
}
