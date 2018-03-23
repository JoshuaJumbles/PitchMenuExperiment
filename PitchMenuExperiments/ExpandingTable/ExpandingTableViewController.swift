//
//  ExpandingTableViewController.swift
//  PitchMenuExperiments
//
//  Created by Joshua Safran on 3/23/18.
//  Copyright © 2018 Joshua Safran. All rights reserved.
//


import Foundation
import UIKit


class ExpandingTableViewController:UIViewController{
    var currentMenuItems: [MenuItem]?
    
    @IBAction func didTapPitch(_ sender: Any) {
        presentMenu(items:pitchMenu)
    }
    
    func presentMenu(items:[MenuItem]){
        currentMenuItems = items
        guard let items = currentMenuItems
            else{
                return
        }
        //TODO: Present Menu
    }
    
    //Generate Data
    
    func didTapButton(button:UIButton){
        if let childrenOptions = currentMenuItems?[button.tag].childrenMenuItems,
            childrenOptions.count > 0{
            presentMenu(items: childrenOptions)
        }
    }
    
}
