//
//  RestaurantCollectionViewCell.swift
//  TouristGuide
//
//  Created by technomix on 13.02.23.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var locationlbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var bookLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
      setUpUI()
    }
    
    func configureRestaurant(with rest : Restaurant){
        restaurantName.text = rest.name
        restaurantImage.kf.setImage(with: URL(string: rest.image))
        restaurantName.textColor = .white
        rateLbl.text = "\(rest.rate) ⭐️"
        locationlbl.text = rest.city
        
    }
    private func setUpUI(){
        restaurantImage.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.backgroundColor = .black
        bookLbl.layer.masksToBounds = true
        bookLbl.layer.cornerRadius = 10
        
        
        
    }

}
