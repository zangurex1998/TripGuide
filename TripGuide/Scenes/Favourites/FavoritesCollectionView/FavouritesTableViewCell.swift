//
//  FavouritesTableViewCell.swift
//  TripGuide
//
//  Created by technomix on 17.02.23.
//

import UIKit
import Kingfisher
import CoreData

//enum OneCase: [NSEntityDescription], CaseIterable {
//
//    case fetchedFavorites
//     
//     var changeCategory : OneCase {
//        switch self {
//        case .fetchedFavorites:
//            return Favourite
//        }
//    }
//}
class FavouritesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var forTableView : [Favourite] = []{
        didSet{
            self.collectionVIew.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpcollectionView()
        fetchData()
    }
    
    private func fetchData(){
        let request = NSFetchRequest<Favourite>(entityName: "Favourite")
        do{
            forTableView = try context.fetch(request)
        }
        catch{
            print(error)
        }
    }
   
    
    
    private func setUpcollectionView(){
        collectionVIew.dataSource = self
        collectionVIew.delegate = self
        collectionVIew.register(UINib(nibName: "FavoritesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavoritesCollectionViewCell")
    }

   
}

//MARK: - Extension

extension FavouritesTableViewCell: UICollectionViewDelegate{}
extension FavouritesTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        forTableView.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let result = forTableView[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as! FavoritesCollectionViewCell
        
        cell.cityImage.kf.setImage(with: URL(string: result.image ?? "") )
        return cell
    }
    
    
}
extension FavouritesTableViewCell: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 140, height: 140)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
