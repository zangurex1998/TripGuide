//
//  WinterCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 20.02.23.
//

import UIKit
import Kingfisher
class WinterCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var winterImage: UIImageView!
    @IBOutlet weak var resortName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        winterImage.layer.cornerRadius = 10
        setUpContentView()
    }
    
    func configure(with resort: Winter){
        winterImage.kf.setImage(with: URL(string: resort.image))
        resortName.text = resort.name
    }
    
    private func setUpContentView(){
        resortName.layer.masksToBounds = true
        resortName.layer.cornerRadius = 5
        resortName.backgroundColor = .black
        resortName.textColor = .white
        resortName.textAlignment = .center
        
        
    }

}
