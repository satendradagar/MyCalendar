			//
//  CalendarViewController.swift
//  calendar
//
//  Created by nidhi on 4/23/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa

class CalendarViewController: NSViewController {

    @IBOutlet weak var ofirstDayLabel: NSTextField!
    @IBOutlet weak var oSecondDayLabel: NSTextField!
    @IBOutlet weak var oThirdDayLabel: NSTextField!
    @IBOutlet weak var oFourthDayLabel: NSTextField!
    @IBOutlet weak var oFifthDayLabel: NSTextField!
    @IBOutlet weak var oSixthDayLabel: NSTextField!
    @IBOutlet weak var oSeventhDayLabel: NSTextField!
    
    @IBOutlet var mCalendarView: calendarTable!
    
    
    var prefStore = PreferencesStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
//        LoadCalendarHeaderTitle()
        
        var headerDays = prefStore.headerDay
        ofirstDayLabel.stringValue = headerDays[0]
        oSecondDayLabel.stringValue = headerDays[1]
        oThirdDayLabel.stringValue = headerDays[2]
        oFourthDayLabel.stringValue = headerDays[3]
        oFifthDayLabel.stringValue = headerDays[4]
        oSixthDayLabel.stringValue = headerDays[5]
        oSeventhDayLabel.stringValue = headerDays[6]
    }
    
    func LoadCalendarHeaderTitle() -> Void {
        var headerDays = prefStore.headerDay
        ofirstDayLabel.stringValue = headerDays[0]
        oSecondDayLabel.stringValue = headerDays[1]
        oThirdDayLabel.stringValue = headerDays[2]
        oFourthDayLabel.stringValue = headerDays[3]
        oFifthDayLabel.stringValue = headerDays[4]
        oSixthDayLabel.stringValue = headerDays[5]
        oSeventhDayLabel.stringValue = headerDays[6]
    }
    
    //// June 22th Notification received. to reload method.
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ReloadCalendar), name: NSNotification.Name(rawValue: "ReloadCalendarNo"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ReloadCalendar), name: NSNotification.Name(rawValue: "CreatEventNoti"), object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(closeWindow), name: NSNotification.Name(rawValue: "RemoveAgendaView"), object: nil)
        self.mCalendarView.calendarTable.reloadData()
        print("View Will appear")
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "ReloadCalendarNo"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "CreatEventNoti"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ReloadCalendar), name: NSNotification.Name(rawValue: "ReloadCalendarNo"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ReloadCalendar), name: NSNotification.Name(rawValue: "CreatEventNoti"), object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "RemoveAgendaView"), object: nil)
    }
    
    func ReloadCalendar() -> Void {
        LoadCalendarHeaderTitle()
        self.mCalendarView.reloadCalendar();
        
    }
    func closeWindow() -> Void {
        self.mCalendarView.removeAgendaView();
    }
    
}
