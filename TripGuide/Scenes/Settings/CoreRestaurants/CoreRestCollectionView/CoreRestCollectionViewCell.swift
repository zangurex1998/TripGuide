//
//  CoreRestCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 27.02.23.
//

import UIKit
import CoreData
class CoreRestCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var restImage: UIImageView!
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restRate: UILabel!
    @IBOutlet weak var restLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .black
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.cyan.cgColor
        self.layer.cornerRadius = 7
    
    }
    
    func configure(with rest : CoreRestaurants){
        restImage.kf.setImage(with: URL(string: rest.image ?? ""))
        restName.text = rest.name
      //  restRate.text = "⭐️\(rest.rate)"
        restLocation.text = rest.address
        restImage.layer.cornerRadius = 12
    }

}
