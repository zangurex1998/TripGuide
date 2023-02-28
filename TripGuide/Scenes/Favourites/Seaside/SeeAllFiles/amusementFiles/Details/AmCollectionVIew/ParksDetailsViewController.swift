//
//  ParksDetailsViewController.swift
//  TripGuide
//
//  Created by technomix on 28.02.23.
//

import UIKit

class ParksDetailsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var amusements: [Amusment] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    var parksProtocol: AmusementApiManagerProtocol = AmusementApiManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        view.backgroundColor = .black
        parksProtocol.fetchingAmusement { [weak self] parks in
            self?.amusements = parks.amusement
        }
    }
    
   
    
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ParksCollectionView", bundle: nil), forCellWithReuseIdentifier: "parks")
        collectionView.backgroundColor = .black
    }
    
    deinit{
        print("This page Deinited")
    }

}
extension ParksDetailsViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        amusements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "parks", for: indexPath) as! ParksCollectionView
        cell.configure(with: amusements[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }

}
