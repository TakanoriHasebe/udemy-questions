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
    
    /* ここをFirebaseから取得する */
    var images = ["person0", "person1", "person2", "person3", "person4", "person5", "person6", "person7", "person8", "person9", "person10", "person11", "person12", "person13", "person14", "person15", "person16", "person17"]
    var profileName: String! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        /* Press */
        let press = UITapGestureRecognizer(target: self, action: #selector(ViewController.handlePress(_:)))
        press.delaysTouchesBegan = true
        press.delegate = self
        press.cancelsTouchesInView = false
        self.collectionView.addGestureRecognizer(press)
        
        /* LongPress */
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress(_:)))
        lpgr.minimumPressDuration = 0.3
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.collectionView.addGestureRecognizer(lpgr)
        
        self.collectionView.isUserInteractionEnabled = true
        
    }
    
    /* Tapの時の動作 */
    func handlePress(_ gestureReconizer: UITapGestureRecognizer){
        
        
        if gestureReconizer.state != UIGestureRecognizerState.ended {
            return
        }
        
        let p = gestureReconizer.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: p)
        
        if let index = indexPath {
            var cell = collectionView.cellForItem(at: index)
            
            let transform = self.collectionView.transform
            UICollectionView.animate(withDuration: 0.0, animations: {
                cell?.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            })

            /* PopUp動作と画像の保存 */
            profileName = images[index.row]
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.profileImageNumber = profileName
            
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
            /* PopUp動作と画像の保存 */
            
            
            if (gestureReconizer.state == UIGestureRecognizerState.ended) {
                
                print("Tap")
                print(index.row)
                cell?.transform = CGAffineTransform.identity
                
            }
            
            // print("Tap")
            // print(index.row)
        } else {
            print("Tap")
            print("Could not find index path")
        }
        
    }
    
    /* LongPressの時の動作 */
    func handleLongPress(_ gestureReconizer: UILongPressGestureRecognizer) {
        /*
        if gestureReconizer.state != UIGestureRecognizerState.ended {
            return
        }*/
        
        let p = gestureReconizer.location(in: collectionView)
        let indexPath = collectionView.indexPathForItem(at: p)
        
        if let index = indexPath {
            var cell = collectionView.cellForItem(at: index)
            // do stuff with your cell, for example print the indexPath
            
            if( gestureReconizer.state == UIGestureRecognizerState.began) {
                print("Long Press Begin")
                let transform = self.collectionView.transform
                UICollectionView.animate(withDuration: 0.0, animations: {
                    cell?.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
                })
                print(index.row)
            }else if (gestureReconizer.state == UIGestureRecognizerState.ended) {
                cell?.transform = CGAffineTransform.identity
                print("Long Press Over")
            }
            
            
        } else {
            print("Could not find index path")
        }
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    
        return images.count
    }

    /**************** Resizeで表示できないか確認 ****************/
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        
        cell.MyButtonImages.setBackgroundImage(UIImage(named: images[indexPath.row])!, for: UIControlState.normal)
        // cell.MyButtonImages.imageView?.image = UIImage(named: images[indexPath.row])
        cell.MyButtonImages.contentMode = .scaleToFill
        
        // cell.myImage.image = UIImage(named: images[indexPath.row])
        // cell.myImage.contentMode = .scaleAspectFill
        
        
        return cell
        
    }

}

