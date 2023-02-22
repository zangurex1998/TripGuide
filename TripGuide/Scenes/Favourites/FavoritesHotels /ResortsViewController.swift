//
//  ResortsViewController.swift
//  TripGuide
//
//  Created by technomix on 20.02.23.
//

import UIKit

class ResortsViewController: UIViewController {
   

    
    @IBOutlet weak var tableView: UITableView!
    
    var WinterProtocol: WinterApiManagerProtocol = WinterApiManager()
    
    
    var Winterhotels: [Winter] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Suggested Hotels", preferredLargeTitle: true)
        setUpTableView()
        WinterProtocol.fetchingHotels { [weak self] wintercame in
            self?.Winterhotels = wintercame.winter
        }
        navigationItem.backButtonTitle = "" 

    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ResortHotelsTableViewCell", bundle: nil), forCellReuseIdentifier: "ResortHotelsTableViewCell")
        tableView.backgroundColor = .black
        tableView.delegate = self
    }
    

    deinit{
        print("Deinited")
    }

}

extension ResortsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.Winterhotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResortHotelsTableViewCell", for: indexPath) as! ResortHotelsTableViewCell
        cell.configure(with: Winterhotels[indexPath.row])
        return cell
    }
}

extension ResortsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "WinterHDetails", bundle: nil).instantiateViewController(withIdentifier: "WinterHDetails") as! WHotelsDetailsViewController
        vc.hotelString = Winterhotels[indexPath.row].hotelImageTwo
        vc.hotelNameTitle = Winterhotels[indexPath.row].name
        vc.hName = Winterhotels[indexPath.row].hotelName
        vc.rate = Winterhotels[indexPath.row].hotelRate
        vc.wifi = Winterhotels[indexPath.row].wifi
        vc.gymString = Winterhotels[indexPath.row].gym
        vc.parkingString = Winterhotels[indexPath.row].freeParking
        vc.poolString = Winterhotels[indexPath.row].swimmingPool
        vc.minibar = Winterhotels[indexPath.row].minibar
        vc.breakfast = Winterhotels[indexPath.row].freeBreakfast
        vc.hotelDescription = Winterhotels[indexPath.row].hotelInfo
        vc.roomSrvc = Winterhotels[indexPath.row].roomService
        vc.balcony = Winterhotels[indexPath.row].privateBalcony
        vc.noSmoke = Winterhotels[indexPath.row].nonSmokingRoom
        vc.refrig = Winterhotels[indexPath.row].refrigerator
        vc.romantic = Winterhotels[indexPath.row].romantic
        
        
        /*
         roomService.text = roomSrvc == true ? "room service ✅" : ""
         privateBalconyLBl.text = balcony == true ? "private Balcony ✅" : ""
         nonSmokingRoom.text = noSmoke == true ? "No smoking Room 🚭" : ""
         refrigeratorLbl.text = refrig == true ? "Refrigerator ✅" : ""
         romanticLbl.text = romantic == true ?  "Romantic Room 👩‍❤️‍💋‍👨 " : ""
         */
        navigationController?.pushViewController(vc, animated: true)
    }
}
    
