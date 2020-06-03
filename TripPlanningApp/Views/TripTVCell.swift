//
//  TripTVCell.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/2/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import UIKit

class TripTVCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!    
    @IBOutlet weak var tripTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUp(tripModel: TripModel) {
        tripTitleLabel.text = tripModel.tripTitle
    }
}
