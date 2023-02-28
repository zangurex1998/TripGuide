//
//  ExploreViewController.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import UIKit

class ExploreViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var fetchedCities : [City] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    lazy var fetching: ApiManagerProtocol = Apimanager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetching.fetchingCity { [weak self] city in
            self?.fetchedCities = city.cities
        }
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .black
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Explore", preferredLargeTitle: false)
        
    }
   

    

    private func setUpTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ExploreTableViewCell", bundle: nil), forCellReuseIdentifier: "ExploreTableViewCell")
        tableView.delegate = self
        tableView.backgroundColor = .black
        
    }

}
extension ExploreViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreTableViewCell", for: indexPath) as! ExploreTableViewCell
        cell.configure(with: fetchedCities[indexPath.row])
        return cell
    }
    
    
    
}
extension ExploreViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "CityDetail", bundle: nil).instantiateViewController(withIdentifier: "cityDetail") as! CityDetailsViewController
        vc.details = fetchedCities[indexPath.row].detailedStory
        vc.image = fetchedCities[indexPath.row].imageTwo
        vc.pageTitle = fetchedCities[indexPath.row].city
        navigationController?.pushViewController(vc, animated: true)
    }
}
