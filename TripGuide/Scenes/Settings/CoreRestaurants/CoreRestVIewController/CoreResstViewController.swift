//
//  CoreResstViewController.swift
//  TripGuide
//
//  Created by technomix on 27.02.23.
//

import UIKit
import CoreData
import Kingfisher
class CoreResstViewController: UIViewController {
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fetchedRest: [CoreRestaurants] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        fetchFromRest()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        
    }
    
    deinit {
        print("Restaurants Deinited Successfully")
    }
    
    
    //MARK: - Methods
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CoreRestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CoreRestCollectionViewCell")
    }
    
    /// Fetching from RestuarantsCoreData
    
    private func fetchFromRest(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        let request = NSFetchRequest<CoreRestaurants>(entityName: "CoreRestaurants")
        do{
            fetchedRest = try context.fetch(request).reversed()
        }
        catch{
            print(error)
        }
    }
    
    

    

}

extension CoreResstViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fetchedRest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoreRestCollectionViewCell", for: indexPath) as! CoreRestCollectionViewCell
        cell.configure(with: fetchedRest[indexPath.row])
        return cell
    }
    
    
}
