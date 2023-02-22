//
//  TabBarController.swift
//  TouristGuide
//
//  Created by technomix on 09.02.23.
//

import UIKit

class TabBarController: UITabBarController {
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .black
        tabBar.tintColor = UIColor(hex: "F71735")
        self.delegate = self
        tabBar.barTintColor = .black
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.backgroundColor = .black
        tabBar.tintColor = UIColor(hex: "F71735")
       
        
    }
   
    
    
}
extension TabBarController: UITabBarControllerDelegate{
    

    
}
