//
//  WhiteView.swift
//  calendar
//
//  Created by nidhi on 4/23/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa

class WhiteView: NSView {
    
    let cornerRad = CGFloat ( 5 )
    
     

    override func draw(_ dirtyRect: NSRect) {
        
        
        NSColor.white.setFill()
        NSRectFill(dirtyRect);
        super.draw(dirtyRect)

    }
    
}
