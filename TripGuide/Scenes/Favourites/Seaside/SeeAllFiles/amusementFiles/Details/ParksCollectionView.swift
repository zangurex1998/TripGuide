//
//  ParksCollectionView.swift
//  TripGuide
//
//  Created by technomix on 28.02.23.
//

import UIKit
import Kingfisher
class ParksCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var amusementImage: UIImageView!
    @IBOutlet weak var amusmentName: UILabel!
    @IBOutlet weak var amusmentText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func configure(with ammusment  : Amusment){
        amusementImage.kf.indicatorType = .activity
        amusementImage.kf.setImage(with: URL(string: ammusment.image))
        amusmentName.text = ammusment.name
        amusmentText.text = ammusment.about
    }
    
    private func setUpUI(){
        amusmentText.textColor = .white
        amusmentName.textColor = .white
        amusementImage.layer.cornerRadius = 12
    }
    
    
    

}
