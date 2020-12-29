//
//  ViewController.swift
//  MVPtestProject
//
//  Created by Муслим Курбанов on 20.12.2020.
//

import UIKit
import SnapKit

protocol GalleryViewProtocol: class {
    func applyData(model: [Imgaes])
    func failure(error: Error)
}

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    var searchResponse = [Imgaes]() {
        didSet {
            galleryCollectionView.reloadData()
        }
    }
    var presenter: GalleryPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = GalleryPresenter(view: self)
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        
        presenter.addConstaints(view: view, collectionView: galleryCollectionView)
    }
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResponse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryCollectionViewCell
        let item = searchResponse[indexPath.row]
        cell.confingurate(with: item)
        return cell
    }
    
    
}

extension GalleryViewController: GalleryViewProtocol {
    func applyData(model: [Imgaes]) {
        searchResponse.append(contentsOf: model)

    }
    
    func failure(error: Error) {
        print(error.localizedDescription)

    }
    
    
}
    


