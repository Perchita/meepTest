//
//  SourceModel.swift
//  SimpleMeep
//
//  Created by Jose on 22/07/2020.
//  Copyright © 2020 Jose. All rights reserved.
//

import Foundation

public struct ResourceModel: Codable {
    
    let companyZoneId: Int64?
    let id: String?
    let lat: Double?
    let locationType: Int64?
    let lon: Double?
    let name: String?
    let scheduledArrival: Int64?
    let x: Double?
    let y: Double?
    
}
