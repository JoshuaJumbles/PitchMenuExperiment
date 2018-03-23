//
//  MosaicMenuViewController.swift
//  PitchMenuExperiments
//
//  Created by Joshua Safran on 3/23/18.
//  Copyright © 2018 Joshua Safran. All rights reserved.
//

import Foundation
import UIKit

var num = 0

class MosaicMenuViewController:UIViewController{
    var currentMenuItems: [MenuItem]?

    var collectionView:UICollectionView?
    var quiltView:QuiltView?
    
    @IBOutlet weak var pitchButton: UIButton!
    @IBOutlet weak var darkOverlay: UIView!
    
    fileprivate let reuseIdentifier = "CellIdentifier"
    fileprivate let initialCells    = 6
    fileprivate var numbers         = [Int]()
    fileprivate var numberWidths    = [Int]()
    fileprivate var numberHeights   = [Int]()
    
    @IBAction func didTapPitch(_ sender: Any) {
        presentMenu(items:pitchMenu)
    }
    
    func presentMenu(items:[MenuItem]){
        darkOverlay.isHidden = false
        currentMenuItems = items
        guard let items = currentMenuItems
            else{
                return
        }
        setupMenu()
        view.addSubview( collectionView!)
        
        collectionView?.reloadData()
        collectionView?.setNeedsLayout()
        //TODO: Present Menu
    }
    
    func hideMenu(){
        darkOverlay.isHidden = true
        collectionView?.removeFromSuperview()
    }
    
    func setupMenu(){
        collectionView?.removeFromSuperview()
        
        let collectionFrame = CGRect(x: 0, y: 0, width: 300, height: 300)
    
        quiltView = QuiltView()
        quiltView?.scrollDirection = UICollectionViewScrollDirection.vertical
        quiltView?.itemBlockSize = CGSize(width: 64, height:64)
        
        
        collectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: quiltView!)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.delegate = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.center = pitchButton.center
        
        initData()
        
        collectionView?.dataSource = self
        
        
    }
    
    //Generate Data
    
    func didTapButton(button:UIButton){
        if let childrenOptions = currentMenuItems?[button.tag].childrenMenuItems,
            childrenOptions.count > 0{
            presentMenu(items: childrenOptions)
        }
    }
    
    func getRandomColor() -> UIColor {
        let randomRed:CGFloat   = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat  = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    func initData() {
        num = 0
        self.numbers = []
        self.numberWidths = []
        self.numberHeights = []
        
        while num < self.initialCells {
            self.numbers.append(num)
            self.numberWidths.append(self.randomLength())
            self.numberHeights.append(self.randomLength())
            num += 1
        }
    }
    
    func randomLength() -> Int {
        // always returns a random length between 1 and 3, weighted towards lower numbers.
        var result = arc4random() % 6
        // 3/6 chance of it being 1.
        if result <= 2 {
            result = 1
        }
        else if result == 5 {
            result = 2
        }
        else {
            result = 2
        }
        
        return Int(result)
    }
}

extension MosaicMenuViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return currentMenuItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentMenuItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = menuItemColor(index: indexPath.row)
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = currentMenuItems?[indexPath.row].name
        label.numberOfLines = 3
        label.frame = cell.frame
        label.center = CGPoint(x:cell.frame.width/2,y:cell.frame.height/2)
        cell.addSubview(label)
        
//        cell.addGestureRecognizer())
        

        return cell
    }
}

extension MosaicMenuViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let childrenOptions = currentMenuItems?[indexPath.row].childrenMenuItems,
            childrenOptions.count > 0{
            presentMenu(items: childrenOptions)
        }
        else{
            hideMenu()
        }
    }
}

extension MosaicMenuViewController : QuiltViewDelegate {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, blockSizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        // get random width and height values for the cells
        let width  = self.numberWidths[indexPath.row]
        let height = self.numberHeights[indexPath.row]
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetsForItemAtIndexPath indexPath: IndexPath) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
}
