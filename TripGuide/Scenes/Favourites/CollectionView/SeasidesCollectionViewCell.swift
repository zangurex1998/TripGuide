//
//  SeasidesCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 18.02.23.
//

import UIKit
import Kingfisher
class SeasidesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var seaImage: UIImageView!
    @IBOutlet weak var beachName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpContentView()
        
        self.layer.cornerRadius = 10
        
    }
        
        func configure(with sea: Seasides){
            seaImage.kf.setImage(with: URL(string: sea.image))
            beachName.text = sea.beach
        }
        
       
        func setUpContentView(){
            seaImage.layer.cornerRadius = 10
            beachName.layer.masksToBounds = true
            beachName.textAlignment = .center
        }
        
    }

