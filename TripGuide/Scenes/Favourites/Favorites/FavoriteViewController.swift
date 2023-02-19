//
//  FavoriteViewController.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import UIKit
import CoreData
import Kingfisher

enum SegmentedControlC {
    case seaside
    case city
}
class FavoriteViewController: UIViewController {
        
    //MARK: - Outlets
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        navigationController?.tabBarItem.title = ""
        navigationController?.tabBarItem.image = UIImage(systemName: "heart.fill")
    }
    
    //MARK: - Properties
    
  
    
    var seasideManager: SeasideApiManagerProtocol = SeasideApiManager()
    var fetchFavorites: HotelApiManagerProtocol = HotelApiManager()
    var options: SegmentedControlC = .seaside
    
    var fetchedHotels: [Hotels] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    var seaFetched: [Seasides] = []{
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setUpSegmentedControll()
        view.backgroundColor = .systemGray
        navigationController?.tabBarItem.title = "Recomended"
        navigationController?.tabBarItem.image = UIImage(systemName: "heart.fill")
        configureNavigationBar(largeTitleColor: UIColor(hex: "a9e3e8"), backgoundColor: UIColor(hex: "011627"), tintColor: .red, title: "Suggestions", preferredLargeTitle: true)
        seasideManager.fetchingSeasides {[weak self] sea in
            self?.seaFetched = sea.seasides
        }
    }
  
    
    //MARK: - Actions
    
    @IBAction func didTapSegmentedControl(_ sender: UISegmentedControl) {
        
    }
    
    //MARK: - Methods
    
    private func setUpSegmentedControll(){
//        segmentControl.tintColor = .red
//        segmentControl.backgroundColor = .blue
        
    }
    
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SeasidesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeasidesCollectionViewCell")
        collectionView.register(UINib(nibName: "HotelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HotelCollectionViewCell")
        collectionView.backgroundColor = .systemGray
        
       
    }
    

}
extension FavoriteViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(seaFetched.count)
        return seaFetched.count
        
    
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasidesCollectionViewCell", for: indexPath) as! SeasidesCollectionViewCell
                cell.configure(with: seaFetched[indexPath.row])
                return cell
        
            }
        
      
        
    
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}



  

