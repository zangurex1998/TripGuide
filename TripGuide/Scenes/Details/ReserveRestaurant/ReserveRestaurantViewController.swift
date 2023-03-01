//
//  ReserveRestaurantViewController.swift
//  TouristGuide
//
//  Created by technomix on 15.02.23.
//

import UIKit
import Kingfisher
import CoreData
import AVFoundation
class ReserveRestaurantViewController: UIViewController {
 //MARK: - Outlets
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var reserveView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var reserveButton: UIButton!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var averageRate: UILabel!
    @IBOutlet weak var headerAdress: UILabel!
    @IBOutlet weak var dateLayer: UIDatePicker!
    @IBOutlet weak var cityLbl: UILabel!


    //MARK: - properties
    var player: AVAudioPlayer!
    var restName: String?
    var restImage: String?
    var restRating: Int?
    var restLocation: String?
    var city: String?
    var check = Int.random(in: 1000...2000)

    deinit{
        print("Deinited and no memory Leaks anymore!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
      //  reservedView.isHidden = true
       setUpUI()

        //orderView.backgroundColor = UIColor(hex: "a9e3e8")

    }
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }



    //MARK: - Actions




    @IBAction func didTapReserveTable(_ sender: Any) {
        save()
        playSound()
        
        reserveButton.tintColor = .black
        reserveButton.backgroundColor = .green
    }
      
    //MARK: - Actions
    
    private func playSound(){
        guard let url = Bundle.main.url(forResource: "applePay", withExtension: "mp3") else { return }
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        }
        catch{
            print(error)
        }
    }

    /// Saving to CoreData

    private func save(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "CoreRestaurants", in: context) else {return}
        let restaurant = NSManagedObject(entity: entity, insertInto: context)

        guard let image = restImage else { return }
        guard let average = restRating else { return }
        restaurant.setValue(nameLbl.text, forKey: "name")
        restaurant.setValue(image, forKey: "image")
        restaurant.setValue(cityLbl.text, forKey: "address")
        restaurant.setValue(average, forKey: "rate")

        do{
            try context.save()
        }
        catch{
            print(error)
        }

    }



    //MARK: - Methods
    private func setUpUI(){
        reserveView.layer.borderColor = UIColor.gray.cgColor
        reserveView.layer.cornerRadius = 10

        restaurantImage.kf.indicatorType = .activity
        restaurantImage.kf.setImage(with: URL(string: restImage ?? ""))
       restaurantImage.layer.cornerRadius = 10
        restaurantImage.layer.borderWidth = 2
        restaurantImage.layer.borderColor = UIColor.gray.cgColor
          nameLbl.text = restName
        addressLbl.text = restLocation
        reserveView.backgroundColor = UIColor(hex: "011627")
        nameLbl.textColor = .white
        addressLbl.textColor = .white


        reserveButton.backgroundColor = .darkGray
        reserveButton.layer.cornerRadius = 10
        reserveButton.tintColor = .white
        dateLbl.textColor = .white
        averageRate.textColor = .white
        headerAdress.textColor = .white
        guard let rating = restRating else {return}
        averageRate.text! += "\(rating) ⭐️ (reviewed by 140 customer)"
        dateLayer.backgroundColor = UIColor(hex: "011627")
        dateLayer.tintColor = .blue
        cityLbl.text = city


    }


}
