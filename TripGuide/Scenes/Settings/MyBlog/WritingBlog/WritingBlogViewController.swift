//
//  WritingBlogViewController.swift
//  TripGuide
//
//  Created by technomix on 23.02.23.
//

import UIKit
import CoreData
class WritingBlogViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var header: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "My Blog", preferredLargeTitle: true)
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
        print(paths)
    }
    
    
    private func addButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil.tip.crop.circle.badge.plus"), style: .done, target: self, action: #selector(somethingAdded))
        
    }
    @objc func somethingAdded(){
        saveInCoreData()
        
    }
    
    
    private func saveInCoreData(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Blog", in: context) else {return}
        let note = NSManagedObject(entity: entity, insertInto: context)
        
        note.setValue(header.text, forKey: "header")
        note.setValue(content.text, forKey: "content")
        
        do{
            print("saved")
            try context.save()
            
        }
        catch{
            print(error)
        }
    }
    
    /*
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
     */

}
