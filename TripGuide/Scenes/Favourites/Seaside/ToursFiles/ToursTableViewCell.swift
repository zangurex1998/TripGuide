//
//  ToursTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import UIKit

class ToursTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seeall: UILabel!
    
    lazy var tours: [Tour] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
        setupUI()
    }
    
    private func configureCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ToursCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ToursCollectionViewCell")
        collectionView.backgroundColor = .black
    }
    private func setupUI(){
        seeall.layer.masksToBounds = true
        seeall.layer.cornerRadius = 8
        seeall.textAlignment = .center
    }

    
}

extension ToursTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tours.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToursCollectionViewCell", for: indexPath) as! ToursCollectionViewCell
        cell.configure(with: tours[indexPath.row])
        return  cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
