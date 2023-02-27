//
//  AmusementTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 27.02.23.
//

import UIKit

class AmusementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var seeAllLBL: UILabel!
    var amusement: [Amusment] = []{
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        setupUI()
        self.backgroundColor = .black
    }
    
    
    //MARK: - Methods
    private func setupUI(){
        seeAllLBL.layer.masksToBounds = true
        seeAllLBL.layer.cornerRadius = 8
        seeAllLBL.textAlignment = .center
    }
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "AmusementCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AmusementCollectionViewCell")
        collectionView.backgroundColor = .black
    }


    
}

extension AmusementTableViewCell: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        amusement.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"AmusementCollectionViewCell", for: indexPath) as! AmusementCollectionViewCell
        cell.configure(with: amusement[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
}
