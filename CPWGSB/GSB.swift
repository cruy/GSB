//
//  GSB.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 06/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import UIKit
import CoreData

//class GSB {
//    var band: String
//    var reward: Double
//    var quantity: Int
//    var id: Int
//    
//    init(band: String, reward: Double, quantity: Int, id: Int) {
//        self.band = band
//        self.reward = reward
//        self.quantity = quantity
//        self.id = id
//    }
//}

class GSB {
    var band: String
    var reward: Double
    var quantity: Int
    var cellBackgroundColor: UIColor?
    var cellFontColor: UIColor?
    
    
    
    init(band: String, reward: Double, quantity: Int) {
        self.band = band
        self.reward = reward
        self.quantity = quantity
        self.cellBackgroundColor = {
            switch self.band {
            case "A":
                return UIColor(red:0.91, green:0.14, blue:0.25, alpha:1.0)
            case "B":
                return UIColor(red:0.95, green:0.49, blue:0.18, alpha:1.0)
            case "C":
                return UIColor(red:0.99, green:0.83, blue:0.00, alpha:1.0)
            case "D":
                return UIColor(red:0.73, green:0.84, blue:0.16, alpha:1.0)
            case "E":
                return UIColor(red:0.22, green:0.77, blue:0.94, alpha:1.0)
            case "F":
                return UIColor(red:0.30, green:0.18, blue:0.57, alpha:1.0)
            case "G":
                return UIColor(red:0.70, green:0.14, blue:0.53, alpha:1.0)
            case "X":
                return UIColor.white
            case "XL":
                return UIColor.black
            default:
                return UIColor.white
            }
        }()
        self.cellFontColor = {
            switch self.band {
            case "X":
                return UIColor.black
            default:
                return UIColor.white
            }
        }()
    }
}



var tempBandsForUndo = [GSB]()
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







