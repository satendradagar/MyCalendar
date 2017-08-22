//
//  RepeatComboBoxDelegate.swift
//  calendar
//
//  Created by nidhi on 5/3/17.
//  Copyright © 2017 nidhi. All rights reserved.
//
import Cocoa

class RepeatComboBoxDelegate: NSObject, NSComboBoxDelegate  {
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        let comboBox: NSComboBox = (notification.object as? NSComboBox)!
        
        print("comboBox comboBox: \(comboBox)")
        /* This printed “<NSComboBox: 0x6000001e1a00>”*/
        
        print("comboBox objectValueOfSelectedItem: \(String(describing: comboBox.objectValueOfSelectedItem))")
        /* This printed the correct selected String value */
        
        print("comboBox indexOfSelectedItem: \(comboBox.indexOfSelectedItem)")
        /* This printed the correct selected Index value */
    }
    
}
