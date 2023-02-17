//
//  CityDetailsViewController.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import UIKit
import Kingfisher
import CoreData
class CityDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var detailLbl: UILabel!
    
    var image: String?
    var details: String?
    var pageTitle: String?
    var liked : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
        print(paths)
        setUpView()
        navigationItem.backButtonTitle = ""
        configureNavigationBar(largeTitleColor: UIColor(hex: "a9e3e8"), backgoundColor: UIColor(hex: "a9e3e8"), tintColor: .red, title: pageTitle!, preferredLargeTitle: false)
    }
 
    
    deinit{
        print("Deinited and no memory Leaks anymore!")
    }
    
    
  
    
    private func setUpView(){
        cityImage.kf.setImage(with: URL(string: image!))
        cityImage.kf.indicatorType = .activity
        detailLbl.text = details
        setRightButton()
    }
    
    private func setRightButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapHeart))
      
        
    }
    @objc func didTapHeart(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "suit.heart.fill"), style: .done, target: self, action: #selector(taped))
      
        save()
    }
    
    @objc func taped(){
        setRightButton()
       
        print("deleted")
    }
    
    private func save(){
        guard let appdelegate = (UIApplication.shared.delegate as? AppDelegate ) else {return}
        let container = appdelegate.persistentContainer
        let context = container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Favourite", in: context) else {return}
        let favorite = NSManagedObject(entity: entity, insertInto: context)
        
        favorite.setValue(detailLbl.text, forKey: "story")
        favorite.setValue(image, forKey: "image")
        
        do{
            try context.save()
            print("saved")
        }
        catch{
            print(error)
        }
    }
    
    
        
        
        
                
    }
    

