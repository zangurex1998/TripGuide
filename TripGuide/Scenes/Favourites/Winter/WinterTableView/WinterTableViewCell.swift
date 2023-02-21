//
//  WinterTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 20.02.23.
//

import UIKit

class WinterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seeAllLbl: UILabel!
    
    var fetchedWinter: [Winter] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        setupLBL()
    }
    
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "WinterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WinterCollectionViewCell")
        collectionView.delegate = self
        collectionView.backgroundColor = .black
    }
    private func setupLBL(){
        seeAllLbl.textAlignment = .center
        seeAllLbl.layer.masksToBounds = true
        seeAllLbl.layer.cornerRadius = 8
    }

   
    
}

extension WinterTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fetchedWinter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WinterCollectionViewCell", for: indexPath) as! WinterCollectionViewCell
        cell.configure(with: fetchedWinter[indexPath.row])
        return cell
    }
    
    
}

extension WinterTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
