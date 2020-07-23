//
//  Extensions.swift
//  SimpleMeep
//
//  Created by Jose on 22/07/2020.
//  Copyright © 2020 Jose. All rights reserved.
//

import CoreLocation
import Foundation
import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

