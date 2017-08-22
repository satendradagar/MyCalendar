//
//  PopUpWindowController.swift
//  calendar
//
//  Created by nidhi on 5/3/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa
import EventKit

class PopUpWindowController: NSWindowController {
    
    var WindowPos : CGPoint =  CGPoint(x: 0 , y: 0    );
    var createEventRef : CreateEvent?
    @IBOutlet weak var biWeeklyCheckBox: NSButton!
    @IBOutlet weak var monButton: NSButton!
     @IBOutlet weak var tueButton: NSButton!
     @IBOutlet weak var wedButton: NSButton!
     @IBOutlet weak var thuButton: NSButton!
     @IBOutlet weak var friButton: NSButton!
     @IBOutlet weak var satButton: NSButton!
     @IBOutlet weak var sunButton: NSButton!
    var days  : [EKRecurrenceDayOfWeek] = []
    var biWeekly = false
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        self.window?.setFrameTopLeftPoint(WindowPos)
        if ( biWeekly == true)
        {
            biWeeklyCheckBox.state = NSOnState
        }
       
            setDayButton()
       
    }
    
    func getEKDay( _ day : Int) -> EKWeekday
    {
        var returnDay : EKWeekday
        switch day
        {
        case 1 : returnDay = .sunday
        case 2 : returnDay = .monday
        case 3 : returnDay = .tuesday
        case 4 : returnDay = .wednesday
        case 5 : returnDay = .thursday
        case 6 : returnDay = .friday
        case 7 : returnDay = .saturday
            
        default : returnDay = .sunday
            
        }

        return returnDay
    }
    func setDayButton()
    {
        
        if(days.count == 0){
            let myComponents = (Calendar.current as NSCalendar).components(.weekday, from: Date())
            
            days.append(EKRecurrenceDayOfWeek( getEKDay( myComponents.weekday!)))
        }
        
        for day in days {
            let recDay = day.dayOfTheWeek
            switch recDay
            {
            case .sunday : sunButton.state = NSOnState
            case .monday : monButton.state = NSOnState
            case .tuesday : tueButton.state = NSOnState
            case .wednesday : wedButton.state = NSOnState
            case .thursday : thuButton.state = NSOnState
            case .friday : friButton.state = NSOnState
            case .saturday : satButton.state = NSOnState
                
            }
        }
    }
    
    override func showWindow(_ sender: Any?) {
       
        self.window?.setFrameTopLeftPoint(WindowPos)
       
        super.showWindow(sender)
        
    }

    @IBAction func okPressed(_ sender: AnyObject) {
        self.window?.close()
        self.window?.orderOut(sender)
        self.window?.sheetParent?.endSheet(self.window!)
        createEventRef!.WeeklyPopUpOKPressed(sender)
    }
    
    @IBAction func cancelPressed(_ sender: AnyObject) {
        self.window?.close()
        self.window?.orderOut(sender)
        self.window?.sheetParent?.endSheet(self.window!)
        createEventRef!.WeeklyPopUpCancelPressed( sender)
    }

    
}
