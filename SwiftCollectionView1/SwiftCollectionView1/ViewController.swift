//
//  ViewController.swift
//  SwiftCollectionView1
//
//  Created by Takanori.H on 2017/06/06.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

//
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate
 {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = ["one", "two", "three", "four", "five", "six"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress(_:)))
        lpgr.minimumPressDuration = 0.5
        // lpgr.accessibilityElementsHidden = true
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.collectionView.addGestureRecognizer(lpgr)

    }
    
    func handleLongPress(_ gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizerState.ended {
            return
        }
        
        let p = gestureReconizer.location(in: collectionView)
        let indexPath = collectionView.indexPathForItem(at: p)
        
        if let index = indexPath {
            var cell = collectionView.cellForItem(at: index)
            // do stuff with your cell, for example print the indexPath
            print(index.row)
        } else {
            print("Could not find index path")
        }
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    
        return images.count
    }

    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        
        cell.MyButtonImages.setBackgroundImage(UIImage(named: images[indexPath.row])!, for: UIControlState.normal)
        // cell.MyButtonImages.imageView?.image = UIImage(named: images[indexPath.row])
        cell.MyButtonImages.contentMode = .scaleAspectFill
        
        // cell.myImage.image = UIImage(named: images[indexPath.row])
        // cell.myImage.contentMode = .scaleAspectFill
        
        
        return cell
        
    }

}

