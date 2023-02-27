//
//  PlannedTourTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 23.02.23.
//

import UIKit
import Kingfisher
import CoreData
class PlannedTourTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tourImage: UIImageView!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var phonNum: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        tourImage.layer.cornerRadius = tourImage.bounds.width / 2
        setUpUI()
    }
    
    private func setUpUI(){
        heartButton.tintColor = .cyan
//        heartButton.layer.borderColor = UIColor.white.cgColor
//        heartButton.layer.borderWidth = 0.5
    }
    
    
  

    
    
}
