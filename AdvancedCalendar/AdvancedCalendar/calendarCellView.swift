//
//  calendarCellView.swift
//  calendar
//
//  Created by nidhi on 4/22/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa

class calendarCellView: NSTableCellView {

    override func draw(_ dirtyRect: NSRect) {
       
        let button = NSActionCell()
//        button.cell
        // Drawing code here.
        // 7th June
        _ = NSColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        let circleRect = NSMakeRect(dirtyRect.minX + 5, dirtyRect.minY + 5, dirtyRect.maxX - 7, dirtyRect.maxY  - 7)
        let bPath:NSBezierPath = NSBezierPath(ovalIn: circleRect)
      
        let borderColor = NSColor.gray
        borderColor.set()
        bPath.lineWidth = 2.0
        bPath.stroke()
        
        
         super.draw(dirtyRect)
    }
    
}
