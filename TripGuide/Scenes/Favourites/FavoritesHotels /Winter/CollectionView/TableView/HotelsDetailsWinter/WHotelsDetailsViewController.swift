//
//  WHotelsDetailsViewController.swift
//  TripGuide
//
//  Created by technomix on 20.02.23.
//

import UIKit
import Kingfisher
import CoreData
import AVFoundation
class WHotelsDetailsViewController: UIViewController {
     //MARK: - Outlets
     /// Property amenities
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var wifiLbl: UILabel!
    @IBOutlet weak var gymLbl: UILabel!
    @IBOutlet weak var parkinglbl: UILabel!
    @IBOutlet weak var swimmingPool: UILabel!
    @IBOutlet weak var miniBarlbl: UILabel!
    @IBOutlet weak var freebreakfastlbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var detailsView: UIView!

    /// Room Features
   
    @IBOutlet weak var privateBalconyLBl: UILabel!
    @IBOutlet weak var roomService: UILabel!
    @IBOutlet weak var nonSmokingRoom: UILabel!
    @IBOutlet weak var refrigeratorLbl: UILabel!
    @IBOutlet weak var romanticLbl: UILabel!
    
    /// Button Design

    @IBOutlet weak var addFavouritesButton: UIButton!
    
    //MARK: - Properties
    ///AVAudioplayer
    var player : AVAudioPlayer?
    var hotelString: String?
    var hotelNameTitle: String?
    var hName: String?
    var rate: Double?
    //MARK: - Room Features
    var balcony: Bool?
    var roomSrvc: Bool?
    var noSmoke: Bool?
    var refrig: Bool?
    var romantic: Bool?
    
    //MARK: - Property amenities
    var wifi: Bool?
    var gymString: Bool?
    var parkingString: Bool?
    var poolString:  Bool?
    var minibar: Bool?
    var breakfast: Bool?
    var hotelDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setUpContentView()
      
    }
    

    
    
    
    
    deinit {
        print("Deinited! Success")
    }
    
    //MARK: - Actions
    
    @IBAction func didTapAddButton(_ sender: Any) {
        saveData()
        audioPLayer()
    }
    
    //MARK: - Methods
    
    private func saveData(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "CoreHotels", in: context) else {return}
        let hotels = NSManagedObject(entity: entity, insertInto: context)
      
        guard let image = hotelString else {return}
        guard let hrate = rate  else {return}
        hotels.setValue(hotelName.text, forKey: "name")
        hotels.setValue(image, forKey: "image")
       // hotels.setValue(, forKey: <#T##String#>)
        hotels.setValue(hrate, forKey: "rate")
        
        
        do{
            try context.save()
            print("saved")
        }
        catch{
            print(error)
        }
        
       
        
        
    }
    
    private func audioPLayer(){
        guard let url = Bundle.main.url(forResource: "applePay", withExtension: "mp3") else {return}
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    private func setUpContentView(){
        addFavouritesButton.layer.cornerRadius = 15
        addFavouritesButton.backgroundColor = .systemGray
        addFavouritesButton.tintColor = .cyan
        detailsView.layer.cornerRadius = 7
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: hotelNameTitle ?? "", preferredLargeTitle: true)
        hotelImage.kf.setImage(with: URL(string: hotelString ?? ""))
        hotelImage.layer.cornerRadius = 8
        hotelName.text = hName
        guard let rate = rate else {return}
        rateLbl.text = "(\(rate) ⭐️)"
        /// Property amenities
        wifiLbl.text = wifi == true ? "Free Wifi ✅ " : ""
        gymLbl.text = gymString == true ?  "Gym 🏋️ " : ""
        parkinglbl.text = parkingString == true ? "Parking 🚗" : ""
        swimmingPool.text = poolString == true ? "Pool 🏊 " : ""
        miniBarlbl.text = minibar == true ? "minibar 🥃 " : ""
        freebreakfastlbl.text = breakfast == true ? "Free Breakfast 🍱" : ""
        descriptionLbl.text = hotelDescription
        /// setting up room features
        
       
        /*
         privateBalconyLBl: UILabel!
        @IBOutlet weak var roomService: UILabel!
        @IBOutlet weak var nonSmokingRoom: UILabel!
        @IBOutlet weak var refrigeratorLbl: UILabel!
        @IBOutlet weak var romanticLbl: UILabel!
         var balcony: String?
         var roomSrvc: String?
         var noSmoke: String?
         var refrig: String?
         var romantic: String?
        
         */
        
        roomService.text = roomSrvc == true ? "room service ✅" : ""
        privateBalconyLBl.text = balcony == true ? "private Balcony ✅" : ""
        nonSmokingRoom.text = noSmoke == true ? "No smoking Room 🚭" : ""
        refrigeratorLbl.text = refrig == true ? "Refrigerator ✅" : ""
        romanticLbl.text = romantic == true ?  "Romantic Room 👩‍❤️‍💋‍👨 " : ""
        
        
    }

}
