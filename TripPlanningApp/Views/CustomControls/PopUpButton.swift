//
//  PopUpButton.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/3/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import UIKit

class PopUpButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Colors.accentColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
        
    }

}
