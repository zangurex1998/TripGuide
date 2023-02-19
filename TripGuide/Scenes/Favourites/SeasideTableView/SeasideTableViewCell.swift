//
//  SeasideTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 18.02.23.
//

import UIKit

class SeasideTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var seaSideImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configure(with sea: Seasides){
        seaSideImage.kf.setImage(with: URL(string: sea.image))
    }
   
}
