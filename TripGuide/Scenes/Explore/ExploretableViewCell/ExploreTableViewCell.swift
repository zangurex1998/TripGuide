//
//  ExploreTableViewCell.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import UIKit
import Kingfisher
class ExploreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        cityImage.layer.cornerRadius = 45
    }
    
    func configure(with city: City){
        cityName.text = city.city
        cityImage.kf.setImage(with: URL(string: city.image))
        cityImage.kf.indicatorType = .activity
      //  storyLabel.textColor = UIColor(hex: "333333")
    }
    
    
   
    
}
