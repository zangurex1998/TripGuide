//
//  ResortHotelsTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 20.02.23.
//

import UIKit
import Kingfisher
class ResortHotelsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelImage: UIImageView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpcontentView()
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
        self.backgroundColor = .black
    }

    func configure(with item : Winter){
        locationName.text = item.name
        hotelName.text = item.hotelName
        hotelImage.kf.indicatorType = .activity
        hotelImage.kf.indicator?.view.tintColor = .white
        hotelImage.kf.setImage(with: URL(string: item.hotelImage))
        rateLbl.text = "Rating: \(item.hotelRate)⭐️"
    }
    
    private func setUpcontentView(){
        detailsLabel.layer.masksToBounds = true
        detailsLabel.layer.cornerRadius = 7
        hotelImage.layer.cornerRadius = 7 
    }
    
}
