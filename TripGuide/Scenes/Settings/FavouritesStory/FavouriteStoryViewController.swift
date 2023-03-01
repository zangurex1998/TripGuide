//
//  FavouriteStoryViewController.swift
//  TripGuide
//
//  Created by technomix on 01.03.23.
//

import UIKit
import CoreData
class FavouriteStoryViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var fetchedFavs: [FavouriteStory] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Country Sides", preferredLargeTitle: true)
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FavTableViewCell", bundle: nil), forCellReuseIdentifier: "FavTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetching()
    }
    
    deinit{
        print("This page was deinited Too")
    }
    
    private func fetching(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else { return }
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        
        let request = NSFetchRequest<FavouriteStory>(entityName: "FavouriteStory")
        
        do{
            fetchedFavs = try context.fetch(request)
        }
        catch{
            print(error)
        }
    }

   

}

extension FavouriteStoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedFavs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavTableViewCell", for: indexPath) as! FavTableViewCell
        cell.configure(with: fetchedFavs[indexPath.row])
        
        return cell
        
    }
    
    
}
