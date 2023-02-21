//
//  WinteerCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 21.02.23.
//

import UIKit

class WinteerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var resortLbl: UILabel!

    @IBOutlet weak var resortImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpContentView()
    }
    
    func configure(with winter: Winter){
        resortImage.kf.setImage(with: URL(string: winter.image))
        resortLbl.text = winter.name
    }
    
   
    func setUpContentView(){
        resortImage.layer.cornerRadius = 10
        resortLbl.layer.masksToBounds = true
        resortLbl.textAlignment = .center
    }
    
    

}
