//
//  RadialMenuViewController.swift
//  PitchMenuExperiments
//
//  Created by Joshua Safran on 3/23/18.
//  Copyright © 2018 Joshua Safran. All rights reserved.
//

import Foundation


import UIKit


class RadialMenuViewController: UIViewController {

    @IBOutlet weak var darkOverlay: UIView!
    @IBOutlet weak var pitchButton: UIButton!
    
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
        let angle = (180.0/5.0) * Double(items.count)
        ALRadialMenu()
            .setButtons(buttons: generateButtons(items:items))
            .setDelay(delay: 0.01)
            .setRadius(radius: 120)
            .setStartAngle(degrees: 0 - (180.0+angle)/2.0)
            .setCircumference(degrees: angle)
            .setOverlayBackgroundColor(backgroundColor: UIColor.black.withAlphaComponent(0.7))
            .setAnimationOrigin(animationOrigin: pitchButton.center)
            .presentInView(view: view)
    }
    
    func generateButtons(items:[MenuItem]) -> [ALRadialMenuButton] {
        
        var buttons = [ALRadialMenuButton]()
        
        for i in 0..<items.count {
            let button = ALRadialMenuButton(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
            button.setBackgroundImage(UIImage(named: "icon\(i+1)"), for: UIControlState.normal)
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            label.textAlignment = .center
            label.text = items[i].name
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 2
            label.frame = button.frame
            button.addSubview(label)
            label.center = button.center
            
            button.action = didTapButton
            button.tag = i
            
            buttons.append(button)
        }
        
        return buttons
    }
    
    func didTapButton(button:UIButton){
        if let childrenOptions = currentMenuItems?[button.tag].childrenMenuItems,
            childrenOptions.count > 0{
            presentMenu(items: childrenOptions)
        }
    }

    
    
    
    
    

}
