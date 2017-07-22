//
//  ViewController.swift
//  SwiftTabBarCollection
//
//  Created by Takanori.H on 2017/07/22.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = ["one", "two", "three", "four", "five", "six"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        
        cell.myImages.setBackgroundImage(UIImage(named: images[indexPath.row])!, for: UIControlState.normal)
        // cell.MyButtonImages.imageView?.image = UIImage(named: images[indexPath.row])
        cell.myImages.contentMode = .scaleToFill
        
        // cell.myImage.image = UIImage(named: images[indexPath.row])
        // cell.myImage.contentMode = .scaleAspectFill
        
        
        return cell
        
    }
    
}

