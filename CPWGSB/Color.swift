//
//  Color.swift
//  CPWGSB
//
//  Created by Peter Spitzer on 27/08/2016.
//  Copyright © 2016 Spitzer IT. All rights reserved.
//

import Foundation

class Color {
    var colorHex: String
    var fontColorHex: String
    
    init(colorHex: String, fontColorHex: String){
        self.colorHex = colorHex
        self.fontColorHex = fontColorHex
    }

}

let colors: [Color] = [
    Color(colorHex: "E9233F", fontColorHex: "FEFFFF"),
    Color(colorHex: "F27D2E", fontColorHex: "FEFFFF"),
    Color(colorHex: "FCD301", fontColorHex: "FEFFFF"),
    Color(colorHex: "BBD729", fontColorHex: "FEFFFF"),
    Color(colorHex: "38C5F0", fontColorHex: "FEFFFF"),
    Color(colorHex: "4D2F91", fontColorHex: "FEFFFF"),
    Color(colorHex: "B32387", fontColorHex: "FEFFFF"),
    Color(colorHex: "FEFFFF", fontColorHex: "00244D"),
    Color(colorHex: "000000", fontColorHex: "FEFFFF")
]



