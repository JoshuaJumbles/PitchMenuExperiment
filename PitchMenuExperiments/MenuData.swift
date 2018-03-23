//
//  TableData.swift
//  PitchMenuExperiments
//
//  Created by Joshua Safran on 3/23/18.
//  Copyright © 2018 Joshua Safran. All rights reserved.
//

import Foundation


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
    MenuItem(),
    MenuItem(),
    MenuItem(),
    MenuItem(),
    MenuItem(),
    MenuItem()
]

let otherMenu = [
    MenuItem(),
    MenuItem(),
    MenuItem(),
    MenuItem(),
    MenuItem(),
    MenuItem()
]

