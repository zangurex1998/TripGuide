//
//  MyFavoritesCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import UIKit

class MyFavoritesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var headerlbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerlbl.textColor = .white
    }
    
    func configure(with page: LastPage ){
        headerlbl.text = page.cellHeader
    }
    
  
    
    
}
