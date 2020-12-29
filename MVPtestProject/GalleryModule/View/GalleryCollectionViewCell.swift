//
//  GalleryCollectionViewCell.swift
//  MVPtestProject
//
//  Created by Муслим Курбанов on 21.12.2020.
//

import UIKit
import SDWebImage

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    
    func confingurate(with model: Imgaes) {
        imageView.sd_setImage(with: URL(string: model.urls["small"] ?? ""), completed: nil)
        imageLabel.text = model.description
//        imageLabel.text = model.alt_description
    }
    
    
}
