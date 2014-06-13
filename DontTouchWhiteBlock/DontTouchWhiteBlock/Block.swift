//
//  Block.swift
//  DontTouchWhiteBlock
//
//  Created by MSX's IMAC on 14-6-11.
//  Copyright (c) 2014Y MSX's IMAC. All rights reserved.
//

import Foundation
import UIKit


class Block : UIView
{
    var line = 0
    init(frame: CGRect, backgroundColor: UIColor,line:Int)
    {
        super.init(frame: frame)
        self.backgroundColor = backgroundColor
        self.line = line
    }

}