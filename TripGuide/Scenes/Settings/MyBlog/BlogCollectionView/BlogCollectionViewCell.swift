//
//  BlogCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 23.02.23.
//

import UIKit
import Kingfisher
class BlogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var touristImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpContentView()
    }
    
    
    private func setUpContentView(){
        textLbl.backgroundColor = .black
        textLbl.textColor = .white
        headerLbl.textColor = .white
        touristImage.kf.setImage(with: URL(string: "https://png.pngtree.com/png-vector/20220716/ourmid/pngtree-confused-tourist-man-and-woman-search-way-vector-png-image_6001995.png"))
        touristImage.layer.cornerRadius = touristImage.frame.width / 2
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.borderWidth = 0.5
    }
    
    

}
