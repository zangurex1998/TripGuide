//
//  ToursDetTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import UIKit
import Kingfisher
class ToursDetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tournNameLbl: UILabel!
    @IBOutlet weak var tourImage: UIImageView!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpcontentView()
    }
    
    func configure(with tour: Tour){
        tournNameLbl.text = tour.name
        tourImage.kf.indicatorType = .activity
        tourImage.kf.setImage(with: URL(string: tour.image))
        ageLbl.text = tour.ages
        priceLbl.text = "Price: \(tour.price)"
    }
    
    private func setUpcontentView(){
        detailsLbl.layer.masksToBounds = true
        detailsLbl.layer.cornerRadius = 7
        detailsLbl.layer.cornerRadius = 7
        tourImage.layer.cornerRadius = 7
    }

}
