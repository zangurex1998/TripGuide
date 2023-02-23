//
//  SettingsViewController.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import UIKit

class SettingsViewController: UIViewController {
    
//MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    var shared = CollectionDataSource.shared.pageHeader
   // var myFavorites: [LastPage] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        navigationController?.tabBarItem.image = UIImage(systemName: "person.fill")
        navigationController?.tabBarItem.title = "Profile"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .black, title: "Profile", preferredLargeTitle: false
        )
        setUpCollectionView()
    }
    
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MyFavoritesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "userProfile")
        collectionView.delegate = self
        collectionView.backgroundColor = .black
    }
    


}

extension SettingsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shared.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userProfile", for: indexPath) as! MyFavoritesCollectionViewCell
        cell.configure(with: shared[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width   , height: 70)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 0)
    }
    
    /// Needs to Be configured
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let vc = UIStoryboard(name: "Summer", bundle: nil).instantiateViewController(withIdentifier: "summer")
            navigationController?.pushViewController(vc, animated: true)
        case 5 :
            let vc = UIStoryboard(name: "BlogStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "blog")
            navigationController?.pushViewController(vc, animated: true)
        case 2 :
            let vc = UIStoryboard(name: "PlannedTour", bundle: nil).instantiateViewController(withIdentifier: "plannedTour")
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    
}
