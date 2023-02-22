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
    
    
}
