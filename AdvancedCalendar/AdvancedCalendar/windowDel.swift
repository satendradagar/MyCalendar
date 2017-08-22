//
//  windowDel.swift
//  calendar
//
//  Created by nidhi on 5/3/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa

class windowDel: NSObject , NSWindowDelegate{
    
    func window(_ window: NSWindow, willPositionSheet sheet: NSWindow, using rect: NSRect) -> NSRect
    {
        var fieldRect = window.frame
        fieldRect.size.height = 0;
        return fieldRect;
    }
    

}
