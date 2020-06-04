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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueConstans.TO_AddTrip_VC {
            let popUp = segue.destination as! AddTripViewController
            popUp.doneSaving = { [weak self] in
                self?.tripTableView.reloadData()
            }
        }
    }
}

extension TripViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constatns.cell, for: indexPath) as! TripTVCell
        cell.setUp(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: Constatns.delete) { (contextualAction, view, actionPerformed: @escaping (Bool) -> Void) in
            
            let alert = UIAlertController(title: Constatns.delete, message: Constatns.deleteDescription, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: Constatns.cancel, style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: Constatns.delete, style: .destructive, handler: { (alertAction) in
                TripFunctions.deleteTrip(index: indexPath.row)
                self.tripTableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        delete.image = UIImage.init(systemName: "delete.left.fill")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
}
