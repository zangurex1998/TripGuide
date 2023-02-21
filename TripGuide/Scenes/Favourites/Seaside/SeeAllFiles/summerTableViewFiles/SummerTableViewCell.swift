//
//  SummerTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 21.02.23.
//

import UIKit
import Kingfisher
class SummerTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var locationlbl: UILabel!
    @IBOutlet weak var hotlLbl: UILabel!
    @IBOutlet weak var hotelIMage: UIImageView!
    
    @IBOutlet weak var ratelbl: UILabel!
    @IBOutlet weak var detailslbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpcontentView()
    }
    
    
    func configure(with hotels: Seasides){
        locationlbl.text = hotels.beach
        hotlLbl.text = hotels.hotelName
        hotelIMage.kf.setImage(with: URL(string: hotels.hotelImage))
        ratelbl.text = "Rating: \(hotels.hotelRate) ⭐️"
    }
    private func setUpcontentView(){
        detailslbl.layer.masksToBounds = true
        detailslbl.layer.cornerRadius = 7
        hotelIMage.layer.cornerRadius = 7
    }
    

}
