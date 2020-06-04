//
//  TripModel.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/2/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import UIKit


class TripModel {
    
    let id: UUID
    var tripTitle: String
    var tripImage: UIImage?
    
    init(tripTitle: String, tripImage: UIImage? = nil) {
        id = UUID()
        self.tripTitle = tripTitle
        self.tripImage = tripImage
    }
}
