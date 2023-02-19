//
//  FavoritesCollectionViewCell.swift
//  TouristGuide
//
//  Created by technomix on 11.02.23.
//

import UIKit
import Kingfisher
class FavoritesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cityImage.layer.cornerRadius = 60
        cityImage.layer.borderColor = UIColor.red.cgColor
        cityImage.layer.borderWidth = 1

        
    }
  
    
    
    

}
