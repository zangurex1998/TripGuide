//
//  WinterTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 21.02.23.
//

import UIKit

class WinterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var seeAlllbl: UILabel!
    @IBOutlet weak var collectionViewCell: UICollectionView!
    
    var winter: [Winter] = [] {
        didSet{
            self.collectionViewCell.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectioView()
        setupContentView()
    }
    
    private func configureCollectioView(){
        collectionViewCell.dataSource = self
        collectionViewCell.register(UINib(nibName: "WinteerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WinteerCollectionViewCell")
        collectionViewCell.delegate = self
        collectionViewCell.backgroundColor = .black
        

        
    }
    private func setupContentView(){
        seeAlllbl.layer.masksToBounds = true
        seeAlllbl.layer.cornerRadius = 8
        seeAlllbl.textAlignment = .center
    }
    

    
    
}

extension WinterTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        winter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WinteerCollectionViewCell", for: indexPath) as! WinteerCollectionViewCell
        cell.configure(with: winter[indexPath.row])
        return  cell
    }
 
    
}
extension WinterTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}


   
    

