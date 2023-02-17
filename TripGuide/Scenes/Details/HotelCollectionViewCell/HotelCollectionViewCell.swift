//
//  HotelCollectionViewCell.swift
//  TouristGuide
//
//  Created by technomix on 13.02.23.
//

import UIKit
import Kingfisher
class HotelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var reserve: UILabel!
    @IBOutlet weak var hotelImage: UIImageView!

    @IBOutlet weak var hotelsName: UILabel!
    
    @IBOutlet weak var detailedLocation: UILabel!
    
    @IBOutlet weak var hotelRate: UILabel!
    
    @IBOutlet weak var hotelsLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpContentView()
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor(hex: "011627")
        
     
        
    }
    func setUpContentView(){
        hotelImage.layer.cornerRadius = 20
        contentView.layer.cornerRadius = 20
        reserve.backgroundColor = .red
        reserve.layer.masksToBounds = true
        reserve.layer.cornerRadius = 10
        hotelsName.textColor = .white
        detailedLocation.textColor = .white
        hotelRate.textColor = .white
        hotelsLocation.textColor = .white
        

    }
    

    func configure(with hotels: Hotels){
        hotelsName.text = hotels.name
        hotelRate.text = String("⭐️ \(hotels.rate)" )
        hotelImage.kf.setImage(with: URL(string: hotels.image))
        hotelsLocation.text = hotels.city
        detailedLocation.text = hotels.location
    }

}
