//
//  GSB.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 06/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GSB {
    var band: String
    var reward: Double
    var quantity: Int
    
    init(band: String, reward: Double, quantity: Int) {
        self.band = band
        self.reward = reward
        self.quantity = quantity
    }
}

var bands: [GSB] = [
    GSB(band: "A", reward: 0.25, quantity: 0),
    GSB(band: "B", reward: 0.75, quantity: 0),
    GSB(band: "C", reward: 1.25, quantity: 0),
    GSB(band: "D", reward: 2.50, quantity: 0),
    GSB(band: "E", reward: 3.50, quantity: 0),
    GSB(band: "F", reward: 4.50, quantity: 0),
    GSB(band: "G", reward: 6.00, quantity: 0),
    GSB(band: "X", reward: 7.00, quantity: 0),
    GSB(band: "XL", reward: 10.00, quantity: 0)
]








