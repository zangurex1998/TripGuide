//
//  PlannedTourViewController.swift
//  TripGuide
//
//  Created by technomix on 23.02.23.
//

import UIKit
import CoreData
import Kingfisher
class PlannedTourViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var fetchedPlan: [TourPlans] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchingFromCore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchingFromCore()
        self.tableView.reloadData()
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .black, tintColor: .red, title: "Planned Trips", preferredLargeTitle: false)
        view.backgroundColor = .black
    }
    
    
    
    
    deinit {
        print("that page was deinited Too")
    }
    
    
    //MARK: - Methods
    
    func fetchingFromCore(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
    
        
        let request = NSFetchRequest<TourPlans>(entityName: "TourPlans")
        
        do{
            fetchedPlan = try context.fetch(request)
        }
        catch{
            print(error)
        }
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PlannedTourTableViewCell", bundle: nil), forCellReuseIdentifier: "PlannedTourTableViewCell")
    }
    

    
}

extension PlannedTourViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedPlan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlannedTourTableViewCell", for: indexPath) as! PlannedTourTableViewCell
        let result = fetchedPlan[indexPath.row]
        
        cell.tourName.text = result.name
        cell.tourImage.kf.setImage(with: URL(string: result.image ?? ""))
        cell.priceLbl.text = result.tourPrice
        cell.PhoneNumberlbl.text = "Contact 📞 \(result.phoneNumb ?? "")"
        return cell
    }
    
    
}
