//
//  ReserveHotelViewController.swift
//  TouristGuide
//
//  Created by technomix on 15.02.23.
//

import UIKit
import Kingfisher
class ReserveHotelViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var descriptiontlbl: UILabel!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var bookButton: UIButton!
    //MARK: - Properties
    var hottelname: String?
    var imageString: String?
    var price: String?
    var city: String?
    var rate: Double?
    var descriptionOf: String?
    var address: String?
    
    deinit{
        print("Deinited and no memory Leaks anymore!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setupUI()
    }
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupUI(){
        guard let image = imageString else {return}
        hotelImage.kf.setImage(with: URL(string: image))
        priceLbl.text = price
        cityLbl.text = city
        addressLabel.text = address
        guard let rating = rate else {return}
        rateLbl.text = "⭐️ \(rating)"
        hotelName.text = hottelname
        descriptiontlbl.text = descriptionOf
        descriptiontlbl.textColor = .white
        bookView.backgroundColor = UIColor(hex: "011627")
        bookButton.layer.cornerRadius = 10
        bookButton.backgroundColor = .darkGray
        bookButton.tintColor = .white
        
    }
    


}
