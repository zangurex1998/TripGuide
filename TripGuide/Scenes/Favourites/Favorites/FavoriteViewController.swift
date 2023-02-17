//
//  FavoriteViewController.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import UIKit
import CoreData
import Kingfisher

class FavoriteViewController: UIViewController {
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        navigationController?.tabBarItem.title = "Favorite"
        navigationController?.tabBarItem.image = UIImage(systemName: "heart.fill")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchedStringImage : String?
    var forTableView : [Favourite] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpTableView()
        navigationController?.tabBarItem.title = "Favorite"
        navigationController?.tabBarItem.image = UIImage(systemName: "heart.fill")
        configureNavigationBar(largeTitleColor: UIColor(hex: "a9e3e8"), backgoundColor: UIColor(hex: "011627"), tintColor: .red, title: "Profile", preferredLargeTitle: true)
    }
    
    
   private func setUpTableView(){
       tableView.dataSource = self
       tableView.register(UINib(nibName: "FavouritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouritesTableViewCell")
   }

}
    extension FavoriteViewController: UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
      }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as! FavouritesTableViewCell
            return cell
        }
    }


