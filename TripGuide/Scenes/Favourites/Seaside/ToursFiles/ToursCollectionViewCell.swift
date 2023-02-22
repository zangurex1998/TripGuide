//
//  ToursCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import UIKit
import Kingfisher
class ToursCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tourImage: UIImageView!
    @IBOutlet weak var tourName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpContentView()
    }
    
    func configure(with tour: Tour){
        tourImage.kf.indicatorType = .activity
        tourImage.kf.setImage(with: URL(string: tour.image))
        tourName.text = tour.name
    }
    
     private func setUpContentView(){
         tourImage.layer.cornerRadius = 10
         tourName.layer.masksToBounds = true
         tourName.textAlignment = .center
         self.layer.cornerRadius = 10
     }

}
