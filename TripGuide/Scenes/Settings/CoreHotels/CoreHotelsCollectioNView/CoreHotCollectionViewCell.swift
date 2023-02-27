//
//  CoreHotCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 27.02.23.
//

import UIKit
import CoreData
import Kingfisher
class CoreHotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var hotlImage: UIImageView!
    @IBOutlet weak var hotlName: UILabel!
    @IBOutlet weak var hotlRate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .black
        setupContent()
        self.layer.borderColor = UIColor.systemCyan.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 7
    }
    
    func configure(with hotls: CoreHotels){
        hotlImage.kf.setImage(with: URL(string: hotls.image ?? ""))
        hotlName.text = hotls.name
        hotlRate.text = "\(hotls.rate) ⭐️"
        
    }
    
    private func setupContent(){
        hotlImage.layer.cornerRadius = 12
        hotlName.textColor = .white
        hotlRate.textColor = .white
    }
}
