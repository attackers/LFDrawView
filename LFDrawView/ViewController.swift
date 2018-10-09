//
//  ViewController.swift
//  LFDrawView
//
//  Created by OS X10_12_6 on 2018/9/28.
//  Copyright © 2018年 OS X10_12_6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let lfV = LFLabel(frame: CGRect(x: 100, y: 100, width: 120, height: 30), drawType: .drawType_fill, arcType: .arcType_ThreeAll, drawColor: UIColor.black)
        lfV.backgroundColor = UIColor.gray
        lfV.setupSourceTimer(3, 5, 10)
        view.addSubview(lfV)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

