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
    var colorHex: String
    var fontColorHex: String
    var quantity: Int = 0
    
    init(band: String, reward: Double, colorHex: String, fontColorHex: String) {
        self.band = band
        self.reward = reward
        self.colorHex = colorHex
        self.fontColorHex = fontColorHex
    }
}

let colorHexA = ""
let colorHexB = ""

let bands: [GSB] = [
    GSB(band: "A", reward: 0.25, colorHex: "E9233F", fontColorHex: "FEFFFF"),
    GSB(band: "B", reward: 0.75, colorHex: "F27D2E", fontColorHex: "FEFFFF"),
    GSB(band: "C", reward: 1.25, colorHex: "FCD301", fontColorHex: "FEFFFF"),
    GSB(band: "D", reward: 2.50, colorHex: "BBD729", fontColorHex: "FEFFFF"),
    GSB(band: "E", reward: 3.50, colorHex: "38C5F0", fontColorHex: "FEFFFF"),
    GSB(band: "F", reward: 4.50, colorHex: "4D2F91", fontColorHex: "FEFFFF"),
    GSB(band: "G", reward: 6.00, colorHex: "B32387", fontColorHex: "FEFFFF"),
    GSB(band: "X", reward: 7.00, colorHex: "FEFFFF", fontColorHex: "00244D"),
    GSB(band: "XL", reward: 10.00, colorHex: "00244D", fontColorHex: "FEFFFF")
]








