//
//  BlogCollectionViewCell.swift
//  TripGuide
//
//  Created by technomix on 23.02.23.
//

import UIKit

class BlogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .red
        setUpContentView()
    }
    
    
    private func setUpContentView(){
        textView.backgroundColor = .black
        
    }
    
    

}
