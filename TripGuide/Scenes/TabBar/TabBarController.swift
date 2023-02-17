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
        tabBar.backgroundColor = UIColor(hex: "011627")
        tabBar.tintColor = UIColor(hex: "F71735")
        self.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.backgroundColor = UIColor(hex: "011627")
        tabBar.tintColor = UIColor(hex: "F71735")
        tabBar.barTintColor = UIColor.white
        
    }
   
    
    
}
extension TabBarController: UITabBarControllerDelegate{
    

    
}
