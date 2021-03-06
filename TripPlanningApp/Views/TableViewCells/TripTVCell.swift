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
    @IBOutlet weak var tripImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndCornorRadius()
        cardView.backgroundColor = Colors.tintColor
        tripImage.layer.cornerRadius = cardView.layer.cornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUp(tripModel: TripModel) {
        tripTitleLabel.text = tripModel.tripTitle
        tripImage.image = tripModel.tripImage
        tripTitleLabel.font = UIFont(name: Fonts.tripTitleFont, size: 32)
    }
}
