//
//  GameLayer.swift
//  DontTouchWhiteBlock
//
//  Created by MSX's IMAC on 14-6-11.
//  Copyright (c) 2014Y MSX's IMAC. All rights reserved.
//

import Foundation
import UIKit

class GameLayer : UIView
{
    let rows = 4
    let cols = 4
    let blockWidth = (UIScreen.mainScreen().bounds.width)/4;
    let blockHeight = (UIScreen.mainScreen().bounds.height)/4;
    let black = UIColor.blackColor()
    let white = UIColor.whiteColor()
    var allBlocks = Block[]()
    init(frame: CGRect)
    {
        super.init(frame: frame)
        for y in 0..rows
        {
            createLines(y)
        }
        backgroundColor = UIColor.greenColor()
        
    }
    
    func createLines(y: Int)
    {
        var index = Int(arc4random()%4)
        for x in 0..cols
        {
            var currentColor = white
            if x == index
            {
                currentColor = black
            }
            
            var b = Block(frame: CGRect(x: CGFloat(x)*(blockWidth), y: CGFloat(3-y)*(blockHeight), width: blockWidth-1, height: blockHeight-1), backgroundColor: currentColor,line: y)
            allBlocks.append(b)
            addSubview(b)
        }
    }
    
    func down()
    {
        createLines(4)
        for index in 0..allBlocks.count
        {
            var block = allBlocks[index]
            UIView.animateWithDuration(0.3, animations: {block.frame.origin.y+=self.blockHeight}, completion: {
                (b:Bool) in
                    if --block.line == -1
                    {
                        println(index)
                        self.allBlocks.removeAtIndex(index)
                    }
                })
        }
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!)
    {
        for touch in touches.allObjects as UITouch[]
        {
            var point = touch.locationInView(self)
            var col = Int(point.x/blockWidth)
            var row = 3-Int(point.y/blockHeight)
            if row==1
            {
                var bgColor = allBlocks[row*rows+col].backgroundColor
                if bgColor == black
                {
                    self.down()
                    allBlocks[row*rows+col].backgroundColor = UIColor.grayColor()
                }
                else
                {
                    
                }
            }
        }
        
    }
    
}