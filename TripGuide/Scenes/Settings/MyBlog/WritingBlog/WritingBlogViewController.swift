//
//  WritingBlogViewController.swift
//  TripGuide
//
//  Created by technomix on 23.02.23.
//

import UIKit
import CoreData
import AVFoundation
class WritingBlogViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var header: UITextField!
    
    @IBOutlet weak var clearAll: UIButton!
    @IBOutlet weak var save: UIButton!
    
    
    //MARK: - Properties
    let date = Date().formatted(.dateTime)
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRightButton()
        setUpButtons()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "My Blog", preferredLargeTitle: false)
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
        print(paths)
    }
    
    private func setUpRightButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "checkmark.circle.fill"), style: .done, target: self, action: #selector(tappedOnSave))
    }
    @objc func tappedOnSave(){
        dismissKeyboard()
    }

    
    deinit {
        print("WritingNoteDeinited")
    }
    
    //MARK: - Actions
    
    @IBAction func didTapClearALl(_ sender: Any) {
        content.text = ""
        
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        saveInCoreData()
        content.text = ""
        header.text = ""
        print("Saved")
        playSound()
        let alert = UIAlertController(title: "You have added new story to your blog 😊", message: "Thank you", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cool 😎", style: .default))
        present(alert, animated: true)
    }
    
    //MARK: - Methods
    
    private func setUpButtons(){
//        clearAll.layer.backgroundColor = UIColor.systemGray.cgColor
//        save.layer.backgroundColor = UIColor.systemGray.cgColor
        clearAll.layer.cornerRadius = 10
        save.layer.cornerRadius = 10
        clearAll.tintColor = .white
        save.tintColor = .white
        content.layer.cornerRadius = 5
        content.layer.borderWidth = 2
        content.layer.borderColor = UIColor.systemOrange.cgColor
        header.attributedPlaceholder = NSAttributedString(string: "Tap Here For Header 🤩 ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemOrange])
    }
    
    private func playSound(){
        let url = Bundle.main.url(forResource: "applePay", withExtension: "mp3")
        player = try? AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    private func saveInCoreData(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "NewBlog", in: context) else {return}
        let note = NSManagedObject(entity: entity, insertInto: context)
        
        note.setValue(header.text, forKey: "header")
        note.setValue(content.text, forKey: "text")
        note.setValue(date, forKey: "date")
        do{
            print("saved")
            try context.save()
            
        }
        catch{
            print(error)
        }
    }
    
   

}
