//
//  ViewController.swift
//  DontTouchWhiteBlock
//
//  Created by MSX's IMAC on 14-6-11.
//  Copyright (c) 2014Y MSX's IMAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var game = GameLayer(frame: UIScreen.mainScreen().bounds);
        view.addSubview(game)
//        game.down()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

