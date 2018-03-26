//
//  TableData.swift
//  PitchMenuExperiments
//
//  Created by Joshua Safran on 3/23/18.
//  Copyright © 2018 Joshua Safran. All rights reserved.
//

import Foundation
import UIKit

struct MenuItem{
    let name:String
    let childrenMenuItems:[MenuItem]
    init(name:String = "Default", childrenMenuItems:[MenuItem] = []){
        self.name = name
        self.childrenMenuItems = childrenMenuItems
    }
}

let pitchMenu = [
    MenuItem(name: "Strike", childrenMenuItems: []),
    MenuItem(name: "Ball", childrenMenuItems: []),
    MenuItem(name: "Foul", childrenMenuItems: []),
    MenuItem(name: "Hit", childrenMenuItems: hitMenu),
    MenuItem(name: "Other", childrenMenuItems: otherMenu),
]

let hitMenu = [
    MenuItem(name: "Ground Ball", childrenMenuItems: hitResultMenu),
    MenuItem(name: "Hard Ground Ball", childrenMenuItems: hitResultMenu),
    MenuItem(name: "Fly Ball", childrenMenuItems: hitResultMenu),
    MenuItem(name: "Line Drive", childrenMenuItems: hitResultMenu),
    MenuItem(name: "Bunt", childrenMenuItems: hitResultMenu),
    MenuItem(name: "Pop Fly", childrenMenuItems: hitResultMenu)
]

let hitResultMenu = [
    MenuItem(name: "Out at 1st"),
    MenuItem(name: "Single"),
    MenuItem(name: "Double"),
    MenuItem(name: "Triple"),
    MenuItem(name: "Home Run"),
    MenuItem(name: "In-Park Home Run"),
    MenuItem(name: "Fielders Choice"),
    
]

let otherMenu = [
    MenuItem(name:"Called Strike"),
    MenuItem(name:"Hit by Pitch"),
    MenuItem(name:"Intentional Ball"),
    MenuItem(name:"Intentional Walk"),
    MenuItem(name:"C. Interference"),
    MenuItem(name:"Balk"),
    MenuItem(name:"Batter Out: Other")
]

func menuItemColor(index:Int)->UIColor{
    let hue = (Float(index) * 0.11).truncatingRemainder(dividingBy: 1)
    return UIColor(hue: CGFloat(hue), saturation: 0.5, brightness: 0.9, alpha: 1)
}

