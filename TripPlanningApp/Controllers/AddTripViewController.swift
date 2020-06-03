//
//  AddTripViewController.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/3/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Fonts.tripTitleFont, size: 22)
    }

    @IBAction func didPressCancelButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func didPressSaveButton(_ sender: UIButton) {
        TripFunctions.createTrip(tripModel: TripModel.init(tripTitle: tripTextField.text!))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
}
