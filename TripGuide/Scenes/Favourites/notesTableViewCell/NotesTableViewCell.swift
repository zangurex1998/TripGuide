//
//  NotesTableViewCell.swift
//  TouristGuide
//
//  Created by technomix on 11.02.23.
//

import UIKit
import CoreData
import Kingfisher
class NotesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var favoritelbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var forTableView : [Favourite] = []{
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
     //   fetchedImage.layer.cornerRadius = 25
       setUpCollectionView()
       fetchData()
        favoritelbl.textColor = UIColor(hex: "F71735")
    }
    
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FavoritesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavoritesCollectionViewCell")
        collectionView.delegate = self
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

   
    
}

extension NotesTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        forTableView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let result = forTableView[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as! FavoritesCollectionViewCell
        cell.cityImage.kf.setImage(with: URL(string: result.image ?? "" ))
        return cell
        
    }
    
    
}
extension NotesTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 140, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    
    
}
