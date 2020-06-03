//
//  TripViewController.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/2/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {
    
    @IBOutlet weak var tripTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripTableView.delegate = self
        tripTableView.dataSource = self
        view.backgroundColor = Colors.backGroundColor
        addButton.createFloatingButton()
        
            TripFunctions.readTrips(completion: { [weak self] in
            self?.tripTableView.reloadData()
        })
    }
    
}

extension TripViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TripTVCell
        cell.setUp(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}
