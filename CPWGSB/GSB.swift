//
//  GSB.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 06/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import Foundation
import UIKit

class GSB {
    var band: String
    var reward: Double
    var quantity: Int = 0
    
    init(band: String, reward: Double) {
        self.band = band
        self.reward = reward
    }
}

let bands: [GSB] = [
    GSB(band: "A", reward: 0.25),
    GSB(band: "B", reward: 0.75),
    GSB(band: "C", reward: 1.25),
    GSB(band: "D", reward: 2.50),
    GSB(band: "E", reward: 3.50),
    GSB(band: "F", reward: 4.50),
    GSB(band: "G", reward: 6.00),
    GSB(band: "X", reward: 7.00),
    GSB(band: "XL", reward: 10.00)
]








