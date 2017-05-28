//
//  ViewController.swift
//  LongTapPressMotion1
//
//  Created by Takanori.H on 2017/05/25.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func TapBtn(_ sender: UITapGestureRecognizer) {
        
        print("Tap")
        
    }
    
    @IBAction func LongTapBtn(_ sender: UILongPressGestureRecognizer) {
        
        //呼び出されたタイミングを確認する。
        if(sender.state == UIGestureRecognizerState.began) {
            print("LongPress")
        } else if (sender.state == UIGestureRecognizerState.ended) {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

