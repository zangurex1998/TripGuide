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
    @IBOutlet weak var PhoneNumberlbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tourImage.layer.cornerRadius = tourImage.bounds.width / 2
    }
    
    
  

    
    
}
