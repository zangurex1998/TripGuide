//
//  CoreHotelsViewController.swift
//  TripGuide
//
//  Created by technomix on 27.02.23.
//

import UIKit
import CoreData
class CoreHotelsViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var coreHotls: [CoreHotels] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        fetchData()
        view.backgroundColor = .black
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Hotels ⭐️", preferredLargeTitle: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        self.collectionView.reloadData()
    }
    
    deinit{
        print("That page is deinited successfully")
    }
    
    //MARK: - Methods
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CoreHotCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CoreHotCollectionViewCell")
        collectionView.backgroundColor = .black
    }
    
    private func fetchData(){
        guard let appdelegate = (UIApplication.shared.delegate as? AppDelegate) else { return }
        let container = appdelegate.persistentContainer
        let context = container.viewContext
        
        let request = NSFetchRequest<CoreHotels>(entityName: "CoreHotels")
        
        do{
            coreHotls = try context.fetch(request).reversed()
        }
        catch{
            print(error)
        }
    }

}

extension CoreHotelsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        coreHotls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoreHotCollectionViewCell", for: indexPath) as! CoreHotCollectionViewCell
        cell.configure(with: coreHotls[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
    }
    
    
    
    
}
