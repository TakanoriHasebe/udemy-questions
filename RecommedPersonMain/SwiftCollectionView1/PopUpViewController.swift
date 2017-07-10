//
//  PopUpViewController.swift
//  SwiftCollectionView1
//
//  Created by Takanori.H on 2017/07/03.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

/*
 課題点
 1. タップしたところの画像、Profileを読み込む
 2. 
 
 */

import UIKit

class PopUpViewController: UIViewController {

    /* profile text */
    // @IBOutlet weak var profileLabel: UILabel!
    private var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /******************** setting profileImage ********************/
        /* 取得された画像の名前 */
        var imageName: String!
        
        /* AppDelegateを通して、保存された名前を取得する */
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        imageName = delegate.profileImageNumber
        
        /* 画面の横幅、縦幅を取得 */
        let screenWidth = CGFloat( UIScreen.main.bounds.size.width)
        let screenHeight = CGFloat(UIScreen.main.bounds.size.height)
        
        /* UIImageViewのサイズを設定する */
        let iWidth: CGFloat = screenWidth
        let iHeight: CGFloat = screenHeight / 3.5
        
        /* UIImageViewのx,yを設定する */
        let posX: CGFloat = (self.view.bounds.width - iWidth)/2
        let posY: CGFloat = self.view.bounds.height / 18
        
        /* UIImage Viewを設定 */
        profileImageView = UIImageView(frame: CGRect(x: posX, y: posY, width: iWidth, height: iHeight))
        
        /* UIImageを作成 */
        let myImage: UIImage = UIImage(named: imageName+".png")!
        
        /* 画像をUIImageViewに設定 */
        profileImageView.image = myImage
        
        profileImageView.contentMode = .scaleAspectFit
        
        /* UIImageViewをViewに追加 */
        self.view.addSubview(profileImageView)
        /******************** setting profileImage ********************/
        
 
        /* profile */
        /*
        profileLabel.text = "was a cold December day when I chose the comfort of my bed over the hype of another Silicon Valley Christmas party. I spent the evening browsing the catalogue of men on Tinder, wondering if my soulmate could actually be a finger swipe away. When M’s profile came up my heart skipped a beat."
        */
        
        /* Animation */
        self.showAnimate()
        
        
    }

    /******************** setting animation ********************/
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.10, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.20, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    /******************** setting animation ********************/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
