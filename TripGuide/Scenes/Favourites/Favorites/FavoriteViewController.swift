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
        
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        navigationController?.tabBarItem.title = ""
        navigationController?.tabBarItem.image = UIImage(systemName: "heart.fill")
    }
    
    //MARK: - Properties
    
  
    
    var seasideManager: SeasideApiManagerProtocol = SeasideApiManager()
    var winterManager: WinterApiManagerProtocol = WinterApiManager()
    var toursFetched: TourAPiManagerProtocol = TourApiManager()
    var fetchedAmusment: AmusementApiManagerProtocol = AmusementApiManager()
    var winterFetched: [Winter] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    lazy var seaFetched: [Seasides] = []{
        didSet{
            self.tableView.reloadData()
        }
       
    }
    
    lazy var tours: [Tour] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    lazy var amusement: [Amusment] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
       
        navigationItem.backButtonTitle = "" 
        navigationController?.tabBarItem.image = UIImage(systemName: "heart.fill")
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Suggestions", preferredLargeTitle: true)
        seasideManager.fetchingSeasides {[weak self] sea in
            self?.seaFetched = sea.seasides
        }
        winterManager.fetchingHotels {[weak self] winterCome in
            self?.winterFetched = winterCome.winter
            
        }
       
        toursFetched.fetchingTours {[weak self] tour in
            self?.tours = tour.tours
        }
        fetchedAmusment.fetchingAmusement { [weak self] ammusement in
            self?.amusement = ammusement.amusement
        }
        
      
    }
  
    
    //MARK: - Actions
    
    @IBAction func didTapSegmentedControl(_ sender: UISegmentedControl) {
        
    }
    
    //MARK: - Methods
    
 
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SeasideTableViewCell", bundle: nil), forCellReuseIdentifier: "SeasideTableViewCell")
        tableView.register(UINib(nibName: "WinterTableViewCell", bundle: nil), forCellReuseIdentifier: "WinterTableViewCell")
        tableView.register(UINib(nibName: "ToursTableViewCell", bundle: nil), forCellReuseIdentifier: "ToursTableViewCell")
        tableView.register(UINib(nibName: "AmusementTableViewCell", bundle: nil), forCellReuseIdentifier: "AmusementTableViewCell")
        tableView.backgroundColor = .black
        tableView.delegate = self
        
        
    }


}

extension FavoriteViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "SeasideTableViewCell", for: indexPath) as! SeasideTableViewCell
            secondCell.seaside = seaFetched
            return secondCell
        } else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WinterTableViewCell", for: indexPath) as! WinterTableViewCell
            cell.winter = winterFetched
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToursTableViewCell", for: indexPath) as!ToursTableViewCell
            cell.tours = tours
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AmusementTableViewCell", for: indexPath) as!AmusementTableViewCell
            cell.amusement = amusement
            return cell
        }
    }
}

    

extension FavoriteViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            let vc = UIStoryboard(name: "ResortHotels", bundle: nil).instantiateViewController(withIdentifier: "resortView")
            navigationController?.pushViewController(vc, animated: true) 
        } else if indexPath.row == 0 {
            let vc = UIStoryboard(name: "Summer", bundle: nil).instantiateViewController(withIdentifier: "summer")
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row  == 2{
            let vc = UIStoryboard(name: "ToursDetails", bundle: nil).instantiateViewController(withIdentifier: "ToursDetails")
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = UIStoryboard(name: "ParksDetails", bundle: nil).instantiateViewController(withIdentifier: "ParksDetails")
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


  

