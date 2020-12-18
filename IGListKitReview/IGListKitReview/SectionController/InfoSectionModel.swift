//
//  InfoSectionModel.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation
import IGListKit

final class InfoSectionModel {
    
    let companies: [Company]
    
    init(companies: [Company]) {
        self.companies = companies
    }
}

// MARK: - ListDiffable

extension InfoSectionModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return String(describing: InfoSectionModel.self) as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}
