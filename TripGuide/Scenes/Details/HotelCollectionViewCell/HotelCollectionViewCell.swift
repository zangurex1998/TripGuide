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
    
//    @IBOutlet weak var detailedLocation: UILabel!
    
    @IBOutlet weak var hotelRate: UILabel!
    
//    @IBOutlet weak var hotelsLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpContentView()

        self.backgroundColor = .black
        
     
        
    }
    func setUpContentView(){
        hotelImage.layer.cornerRadius = 20
        contentView.layer.cornerRadius = 20
        reserve.layer.masksToBounds = true
        reserve.layer.cornerRadius = 10
        hotelsName.textColor = .white

        hotelRate.textColor = .white

        

    }
    

    func configure(with hotels: Hotels){
        hotelsName.text = hotels.name
        hotelRate.text = String("⭐️ \(hotels.rate)" )
        hotelImage.kf.setImage(with: URL(string: hotels.image))

    }

}
