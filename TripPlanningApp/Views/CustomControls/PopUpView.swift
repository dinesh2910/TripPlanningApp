//
//  PopUpView.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/3/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import UIKit

class PopUpView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10.0
        backgroundColor = Colors.backGroundColor
    }
    
}
