//
//  TripModel.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/2/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import Foundation


class TripModel {
    
    let id: UUID
    var tripTitle: String
    
    init(tripTitle: String) {
        id = UUID()
        self.tripTitle = tripTitle
    }
}
