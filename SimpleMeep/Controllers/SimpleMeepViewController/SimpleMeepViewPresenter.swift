//
//  SimpleMeepViewModel.swift
//  SimpleMeep
//
//  Created by Jose on 21/07/2020.
//  Copyright © 2020 Jose. All rights reserved.
//

import Foundation
import GoogleMaps

class SimpleMeepViewPresenter {
   
    private var lowerLeftCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: Constants.latitude1, longitude: Constants.longitude1)
    private var upperRightCoordinate: CLLocationCoordinate2D =  CLLocationCoordinate2D(latitude: Constants.latitude2, longitude: Constants.longitude2)
    
    
    func setRegionCoordinates(_ lowerLeftCoordinate: CLLocationCoordinate2D?, _ upperRightCoordinate: CLLocationCoordinate2D?) {
        self.lowerLeftCoordinate = lowerLeftCoordinate ?? self.lowerLeftCoordinate
        self.upperRightCoordinate = upperRightCoordinate ?? self.upperRightCoordinate
    }
    
    func loadResources(completion: @escaping ([ResourceModel]?) -> Void) {
          SimpleMeepServices.getResurces(place: Constants.place, lowerLeftCoordinate: lowerLeftCoordinate, upperRightCoordinate: upperRightCoordinate) { (resourceModels, error) in
              guard resourceModels != nil else {
                  return
              }
              
            completion(resourceModels)
          }
      }
    
    func groupResourcesByCompany(resources: [ResourceModel]) -> [Int64: [ResourceModel]] {
        return Dictionary(grouping: resources, by: {$0.companyZoneId!})
    }
    
}
