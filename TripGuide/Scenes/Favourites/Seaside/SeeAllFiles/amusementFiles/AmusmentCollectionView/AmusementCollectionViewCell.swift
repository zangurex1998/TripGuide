//
//  AmusementCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 27.02.23.
//

import UIKit
import CoreData
class AmusementCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var parkImage: UIImageView!
    @IBOutlet weak var parkName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .black
        setUpContentView()
    }

    func configure(with amusement: Amusment){
        parkImage.kf.indicatorType = .activity
        parkImage.kf.setImage(with: URL(string: amusement.image))
        parkName.text = amusement.name
    }
    func setUpContentView(){
        parkImage.layer.cornerRadius = 10
        parkName.layer.masksToBounds = true
        parkName.textAlignment = .center
    }

}
