//
//  MosaicMenuViewController.swift
//  PitchMenuExperiments
//
//  Created by Joshua Safran on 3/23/18.
//  Copyright © 2018 Joshua Safran. All rights reserved.
//

import Foundation
import UIKit


class MosaicMenuViewController:UIViewController{
    var currentMenuItems: [MenuItem]?

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.initData()
//
//        // Add some spacing between the top of the view and the first row of
//        // blocks so that it doesn't look like the blocks are being cutoff
//        self.collectionView?.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
//
//        // Do any additional setup after loading the view, typically from a nib.
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.reuseIdentifier)
//
//        let layout = self.collectionView?.collectionViewLayout as! QuiltView
//        layout.scrollDirection = UICollectionViewScrollDirection.vertical
//        layout.itemBlockSize   = CGSize(
//            width: 75,
//            height: 75
//        )
//
//        self.collectionView!.reloadData()
//    }
//
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
