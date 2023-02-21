//
//  SeasideTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 18.02.23.
//

import UIKit

class SeasideTableViewCell: UITableViewCell {
    

    @IBOutlet weak var collectionViewCell: UICollectionView!
    @IBOutlet weak var seeAlllbl: UILabel!
    
    
    //MARK: - Properties
    
    
    var seaside: [Seasides] = [] {
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
        collectionViewCell.register(UINib(nibName: "SeasidesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeasidesCollectionViewCell")
        collectionViewCell.delegate = self
        collectionViewCell.backgroundColor = .black
        

        
    }
    
    private func setupContentView(){
        seeAlllbl.layer.masksToBounds = true
        seeAlllbl.layer.cornerRadius = 8
        seeAlllbl.textAlignment = .center
    }
    
}
extension SeasideTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if seaside.count - 10 > 0 {
            return seaside.count - 10
        }else{
            return seaside.count - 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasidesCollectionViewCell", for: indexPath) as! SeasidesCollectionViewCell
        cell.configure(with: seaside[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
 
}

