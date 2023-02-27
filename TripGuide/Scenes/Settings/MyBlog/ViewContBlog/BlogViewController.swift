//
//  BlogViewController.swift
//  TripGuide
//
//  Created by technomix on 23.02.23.
//

import UIKit
import CoreData
class BlogViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var blogFetched:[NewBlog] = [].reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpRightButton()
        setUpCollectionView()
        navigationItem.backButtonTitle = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreData()
        self.collectionView.reloadData()
    }
    
    private func setUpView(){
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "My Blog", preferredLargeTitle: false)
        view.backgroundColor = .black
        
    }
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "BlogCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BlogCollectionViewCell")
        
    }
    
    func fetchCoreData(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        
        
        let request = NSFetchRequest<NewBlog>(entityName: "NewBlog")
       
        do{
        
            blogFetched = try context.fetch(request).reversed()
        }
        catch{
            print(error)
        }
    }
    
    deinit {
        print("Blog Deinited Successfully !!!")
    }
    
    private func setUpRightButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "note.text.badge.plus"), style: .done, target: self, action: #selector(didSomething))
       // navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    @objc func didSomething(){
        print("Tapped")
        let vc = UIStoryboard(name: "WritingBlog", bundle: nil).instantiateViewController(withIdentifier: "writingBlog")
        navigationController?.pushViewController(vc, animated: true)
    }

  

}

extension BlogViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(blogFetched.count)
        return blogFetched.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlogCollectionViewCell", for: indexPath) as! BlogCollectionViewCell
        
        let result = blogFetched[indexPath.row]
        cell.headerLbl.text = result.header
        cell.textLbl.text = result.text
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
   
    
    
    
}


