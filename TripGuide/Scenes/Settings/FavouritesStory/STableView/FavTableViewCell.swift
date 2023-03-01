//
//  FavTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 01.03.23.
//

import UIKit
import CoreData
import Kingfisher
class FavTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var favText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    private func setUpUI(){
        favImage.layer.cornerRadius = favImage.frame.width / 2
        favImage.layer.borderColor = UIColor.systemOrange.cgColor
        favImage.layer.borderWidth = 1.2
    }
    
    
    func configure(with fav: FavouriteStory){
        favImage.kf.indicatorType = .activity
        favImage.kf.setImage(with: URL(string: fav.image ?? ""))
        favText.text = fav.story
    }

  
}
