//
//  ViewController.swift
//  IGListKitReview
//
//  Created by mobile.simbirsoft on 18.12.2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var companies: [Company]
    
    private lazy var adapter = {
        ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    required init?(coder: NSCoder) {
        
        self.companies = [
            Company(
                id: "ss",
                title: "SimbirSoft",
                logo: UIImage(named: "ss_text")!,
                logoSymbol: UIImage(named: "ss_symbol")!
            ),
            Company(
                id: "mobile-ss",
                title: "mobile SimbirSoft",
                logo: UIImage(named: "mobile_text")!,
                logoSymbol: UIImage(named: "mobile_symbol")!
            )
        ]
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        collectionView.backgroundColor = .white
    }
}

// MARK: - ListAdapterDataSource

extension ViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        
        return [
            InfoSectionModel(companies: companies)
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = InfoSectionController()
        sectionController.delegate = self
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MARK: - NFClientFormSectionControllerDelegate

extension ViewController: InfoSectionControllerDelegate {
    func sectionControllerDidTapField(_ field: ExpandingCellModel) {
        
        guard let company = companies.first(where: { $0.id == field.identifier })
        else { return }
        company.isExpanded.toggle()
        
        adapter.performUpdates(animated: true, completion: nil)
    }
}
