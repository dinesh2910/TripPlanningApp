//
//  TripFunctions.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/2/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import Foundation


class TripFunctions {
    
    static func createTrip(tripModel: TripModel) {
        
    }
    
    static func readTrips(completion: @escaping() -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(tripTitle: "Miami"))
                Data.tripModels.append(TripModel(tripTitle: "Atlanta"))
                Data.tripModels.append(TripModel(tripTitle: "Spain"))
            }
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
    
}