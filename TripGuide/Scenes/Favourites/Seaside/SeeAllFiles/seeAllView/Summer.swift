//
//  SeasideSeeAllViewController.swift
//  TripGuide
//
//  Created by technomix on 21.02.23.
//

import UIKit

class SummerViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var summerFetch: SeasideApiManagerProtocol = SeasideApiManager()
    
    var summer: [Seasides] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Suggested Hotels", preferredLargeTitle: true)
        summerFetch.fetchingSeasides { [weak self] summ in
            self?.summer = summ.seasides
        }
            setUpTableView()
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SummerTableViewCell", bundle: nil), forCellReuseIdentifier: "SummerTableViewCell")
        
    }
    
    
    deinit {
        print("Summer Deinited")
    }
    
}

extension SummerViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        summer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummerTableViewCell", for: indexPath) as! SummerTableViewCell
        cell.configure(with: summer[indexPath.row])
        return  cell
        
    }

    
    
}
