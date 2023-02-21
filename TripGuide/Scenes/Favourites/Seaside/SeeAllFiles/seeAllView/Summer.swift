//
//  SeasideSeeAllViewController.swift
//  TripGuide
//
//  Created by technomix on 21.02.23.
//

import UIKit

class SummerViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var summerFetch: SeasideApiManagerProtocol = SeasideApiManager()
    
    var summer: [Seasides] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Suggested Hotels", preferredLargeTitle: true)
        summerFetch.fetchingSeasides { [weak self] summ in
            self?.summer = summ.seasides
        }
            setUpTableView()
        navigationItem.backButtonTitle = ""
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SummerTableViewCell", bundle: nil), forCellReuseIdentifier: "SummerTableViewCell")
        tableView.backgroundColor = .black
    }
    
    
    deinit {
        print("Summer Deinited")
    }
    
}

extension SummerViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        summer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummerTableViewCell", for: indexPath) as! SummerTableViewCell
        cell.configure(with: summer[indexPath.row])
        return  cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "WinterHDetails", bundle: nil).instantiateViewController(withIdentifier: "WinterHDetails") as! WHotelsDetailsViewController
        vc.hotelString = summer[indexPath.row].hotelImage
        vc.hotelNameTitle = summer[indexPath.row].hotelName
        vc.hName = summer[indexPath.row].hotelName
        vc.rate = summer[indexPath.row].hotelRate
        vc.wifi = summer[indexPath.row].wifi
        vc.gymString = summer[indexPath.row].gym
        vc.parkingString = summer[indexPath.row].freeParking
        vc.poolString = summer[indexPath.row].swimmingPool
        vc.minibar = summer[indexPath.row].minibar
        vc.breakfast = summer[indexPath.row].freeBreakfast
        vc.hotelDescription = summer[indexPath.row].hotelInfo
        vc.roomSrvc = summer[indexPath.row].roomService
        vc.balcony = summer[indexPath.row].privateBalcony
        vc.noSmoke = summer[indexPath.row].nonSmokingRoom
        vc.refrig = summer[indexPath.row].refrigerator
        vc.romantic = summer[indexPath.row].romantic
        
        navigationController?.pushViewController(vc, animated: true)
        
    }

    
    
}
