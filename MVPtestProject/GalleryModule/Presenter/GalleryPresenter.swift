//
//  galleryPresenter.swift
//  MVPtestProject
//
//  Created by Муслим Курбанов on 21.12.2020.
//

import Foundation
import UIKit
import SnapKit

protocol GalleryPresenterProtocol: class {
    init(view: GalleryViewProtocol)
    func getImages()
    func addConstaints(view: UIView, collectionView: UICollectionView)
}

 class GalleryPresenter: GalleryPresenterProtocol {
    
    
    private weak var view: GalleryViewProtocol?
    private let networkService: NetworkServiceProtocol = NetworkService()
    private var searchResponce: [Imgaes]? = nil
    
//    var galleryView = UIView()
//    var galleryCollectionView = UICollectionView()
    
    required init(view: GalleryViewProtocol) {
        self.view = view
        self.getImages()
    }
    
    func addConstaints(view: UIView, collectionView: UICollectionView) {
        collectionView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view)
            make.top.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
    }
    
    func getImages() {
        
        networkService.getImages { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResponce):
                    
                    self.searchResponce = searchResponce
                    self.view?.applyData(model: searchResponce!)
                    
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
