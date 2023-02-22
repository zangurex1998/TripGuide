//
//  TourDetailsTappedViewController.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import UIKit
import Kingfisher
class TourDetailsTappedViewController: UIViewController {
    //MARK: - Outlets
        
    @IBOutlet weak var tourNameLbl: UILabel!
    @IBOutlet weak var tourImage: UIImageView!
    @IBOutlet weak var tourDetails: UILabel!
    @IBOutlet weak var coffeLbl: UILabel!
    @IBOutlet weak var beveragesLbl: UILabel!
    @IBOutlet weak var breakfastlbl: UILabel!
    @IBOutlet weak var wineLbl: UILabel!
    @IBOutlet weak var airConditionerlbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var phNumber: UILabel!
    
    //MARK: - Properties
    
    var tName: String?
    var tImage: String?
    var tDetails: String?
    var coffe: Bool?
    var beverage: Bool?
    var breakfast: Bool?
    var wine: Bool?
    var airConditioner: Bool?
    var price: String?
    var rate: Int?
    var phoneNum: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
       
    }
    
    deinit{
        print("TourDetails Deinited")
    }
    
    
    private func setUpUI(){
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .white, title: tName ?? "", preferredLargeTitle: true)
//        tourNameLbl.text = tName
        tourImage.kf.setImage(with: URL(string: tImage ?? ""))
        tourDetails.text = tDetails
        tourImage.layer.cornerRadius = 7
        coffeLbl.text = coffe == true ? "Coffe/Tea ☕️ " : ""
        beveragesLbl.text = beverage == true ? "Includes Beverage 🧃" : ""
        breakfastlbl.text = breakfast == true ? "Breakfast 🍔" : ""
        wineLbl.text = wine == true ? "Wine Degustation 🍷" : ""
        airConditionerlbl.text = airConditioner == true ? "Air Conditioner Vehicle 🚗" : ""
        guard let phoneNum = phoneNum else {return}
        phNumber.text = "Contact: \(phoneNum)"
        guard let rate = rate else {return}
        rateLbl.text = "Rate: \(rate) ⭐️"
        guard let price = price else {return}
        priceLbl.text = "Price: \(price) "
    }
   
    
    
    

    

    

}

