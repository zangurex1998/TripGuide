//
//  ToursDViewController.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import UIKit

class ToursDViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
     
    var toursDetailsManager: TourAPiManagerProtocol = TourApiManager()

    
    lazy var fetchedTours: [Tour] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        toursDetailsManager.fetchingTours { [weak self] tour in
            self?.fetchedTours = tour.tours
        }
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .white, title: "Suggested Tours", preferredLargeTitle: true)
        navigationItem.backButtonTitle = ""
        
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ToursDetTableViewCell", bundle: nil), forCellReuseIdentifier: "ToursDetTableViewCell")
      
    }
    
    
    deinit {
        print("This page was deinited Too")
    }
   
}

extension ToursDViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedTours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToursDetTableViewCell", for: indexPath) as! ToursDetTableViewCell
        cell.configure(with: fetchedTours[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "TourDetailsTapped", bundle: nil).instantiateViewController(withIdentifier: "TourDetailsTapped") as! TourDetailsTappedViewController
        vc.tImage = fetchedTours[indexPath.row].image
        vc.tName = fetchedTours[indexPath.row].name
        vc.tDetails = fetchedTours[indexPath.row].about
        vc.coffe = fetchedTours[indexPath.row].coffeeOrTea
        vc.breakfast = fetchedTours[indexPath.row].breakfast
        vc.airConditioner = fetchedTours[indexPath.row].AirConditionerVehicle
        vc.wine = fetchedTours[indexPath.row].wineDegustation
        vc.beverage = fetchedTours[indexPath.row].beveragesIncluded
        vc.price = fetchedTours[indexPath.row].price
        vc.rate = fetchedTours[indexPath.row].rate
        vc.phoneNum = fetchedTours[indexPath.row].phoneNumber
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
