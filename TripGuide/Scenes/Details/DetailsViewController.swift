//
//  DetailsViewController.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import UIKit
enum Categories {
    case restaurants
    case hotels
}
class DetailsViewController: UIViewController {
     
    //MARK: - Outlets
    
    //@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var restaurantsButton: UIButton!
    @IBOutlet weak var hotelsButton: UIButton!
    
     var hotelApiManager: HotelApiManagerProtocol = HotelApiManager()
     var restaurantApiManager: RestaurantApiManagerProtocol = RestaurantApiManager()
     var defaultCategory : Categories = .restaurants
     var searchController = UISearchController()
     lazy var hotel: [Hotels] = []{
        didSet{
            self.collectionView.reloadData()
        }
    }
     lazy var restaurant: [Restaurant] = []{
        didSet{
            self.collectionView.reloadData()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        setUpCollectionView()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Choose a Category", preferredLargeTitle: false)
        restaurantApiManager.fetchingHotels {[weak self] restaurants in
            self?.restaurant = restaurants.restaurants
        }
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .black
        setUpSearchController()
        
    }
   

    @IBAction func didTapButton(_ sender: UIButton) {
        switch sender.tag{
        case 0 :
            restaurantsButton.tintColor = .red
            hotelsButton.tintColor = .white
            defaultCategory = .restaurants
            restaurantApiManager.fetchingHotels {[weak self] restaurants in
                self?.restaurant = restaurants.restaurants
            }
        case 1 :
            restaurantsButton.tintColor = .white
            hotelsButton.tintColor = .red
            defaultCategory = .hotels
            hotelApiManager.fetchingHotels {[weak self] hotel in
                self?.hotel = hotel.hotels
            }
        default :
            defaultCategory = .hotels
        }
    }
    
    

                                       
    
    
    //MARK: - Methods
    
    private func setUpSearchController(){
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search hotels or restaurants"
        searchController.searchBar.searchTextField.tintColor = .white
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.backgroundColor = .black
    }
    
    private func configureButtons(){
        restaurantsButton.layer.cornerRadius = 20
        restaurantsButton.backgroundColor = UIColor(hex: "011627")
        restaurantsButton.tintColor = .red
        hotelsButton.layer.cornerRadius = 20
        hotelsButton.backgroundColor = UIColor(hex: "011627")
        hotelsButton.tintColor = .white
        
    }
    
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "RestaurantCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RestaurantCollectionViewCell")
        collectionView.register(UINib(nibName: "HotelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HotelCollectionViewCell")
        collectionView.backgroundColor = .black
   

    }
    

    


}

//MARK: - Extension: - SearchController
extension DetailsViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        
        if defaultCategory == .hotels {
            if text.isEmpty{
                hotelApiManager.fetchingHotels {[weak self] hotel in
                    self?.hotel = hotel.hotels
                }
            }else{
                self.hotel = self.hotel.filter{$0.name.lowercased().contains(text.lowercased())}
                collectionView.reloadData()
            }
        }else{
            if text.isEmpty{
                restaurantApiManager.fetchingHotels {[weak self] restaurants in
                    self?.restaurant = restaurants.restaurants
                }
            }else{
                self.restaurant = self.restaurant.filter{$0.name.lowercased().contains(text.lowercased())}
                collectionView.reloadData()
            }
        }
        
        
    }
    
    
}
//MARK: - Extension: - UICollectionViewDelegate
extension DetailsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if defaultCategory == .restaurants {
            let vc = UIStoryboard(name: "ReserveRestaurant" , bundle: nil).instantiateViewController(withIdentifier: "reserveRest") as! ReserveRestaurantViewController
            vc.restName = restaurant[indexPath.row].name
            vc.restImage = restaurant[indexPath.row].imageTwo
            vc.restRating = restaurant[indexPath.row].rate
            vc.restLocation = restaurant[indexPath.row].location
            vc.city = restaurant[indexPath.row].city
            vc.food = restaurant[indexPath.row].food
            vc.service = restaurant[indexPath.row].service
            vc.valueString = restaurant[indexPath.row].value
            vc.friendlyDiets = restaurant[indexPath.row].specialDiets
            vc.contact = restaurant[indexPath.row].contact
            vc.prices = restaurant[indexPath.row].priceRange
            navigationController?.present(vc, animated: true)
        }else if defaultCategory == .hotels{
            let secondVC = UIStoryboard(name: "WinterHDetails", bundle: nil).instantiateViewController(withIdentifier: "WinterHDetails") as! WHotelsDetailsViewController
            secondVC.hotelString = hotel[indexPath.row].imageThree
            secondVC.hotelNameTitle = hotel[indexPath.row].city
            secondVC.rate = hotel[indexPath.row].rate
            secondVC.hotelDescription = hotel[indexPath.row].description
            secondVC.wifi = hotel[indexPath.row].wifi
            secondVC.minibar = hotel[indexPath.row].minibar
            secondVC.breakfast = hotel[indexPath.row].freeBreakfast
            secondVC.parkingString = hotel[indexPath.row].freeParking
            secondVC.poolString = hotel[indexPath.row].swimmingPool
            secondVC.gymString = hotel[indexPath.row].gym
            secondVC.roomSrvc = hotel[indexPath.row].roomService
            secondVC.balcony = hotel[indexPath.row].privateBalcony
            secondVC.noSmoke = hotel[indexPath.row].nonSmokingRoom
            secondVC.refrig = hotel[indexPath.row].refrigerator
            secondVC.romantic = hotel[indexPath.row].romantic
            secondVC.hName = hotel[indexPath.row].name
            
            navigationController?.present(secondVC, animated: true)
        }
    }
}

extension DetailsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if defaultCategory == .restaurants {
           
            return  restaurant.count
            
        }else{
            
            return hotel.count
            
        }
        
       
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if defaultCategory == .restaurants{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCollectionViewCell", for: indexPath) as! RestaurantCollectionViewCell
            cell.configureRestaurant(with: restaurant[indexPath.row])
            return cell
        }else{
            let secondSell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotelCollectionViewCell", for: indexPath) as! HotelCollectionViewCell
            secondSell.configure(with: hotel[indexPath.row])
            return secondSell
            
        }
        
        
    }
    

    
}
