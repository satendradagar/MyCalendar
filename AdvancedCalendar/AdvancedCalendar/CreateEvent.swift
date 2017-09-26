//
//  CreateEvent.swift
//  calendar
//
//  Created by nidhi on 4/27/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa
import EventKit

class CreateEvent: NSWindowController  , NSComboBoxDelegate  {

    @IBOutlet weak var eventNameOutlet: NSTextField!
    @IBOutlet weak var LocationOutlet: NSTextField!
    @IBOutlet weak var allDayOutlet: NSButton!
    @IBOutlet weak var reminderOutlet: NSButton!
    @IBOutlet weak var startDateOutlet: NSDatePicker!
    @IBOutlet weak var endDateOutlet: NSDatePicker!
    @IBOutlet weak var repeatOutlet: NSComboBox!
    @IBOutlet weak var alertOutlet: NSComboBox!
    @IBOutlet weak var calendarOutlet: NSComboBox!
    
    @IBOutlet weak var WeekOptionsView: NSView!
    
    @IBOutlet var comboPopUp: NSWindow!
   
    @IBOutlet var CreateEventWindow: NSWindow!
    
    dynamic var allDayEvent:Bool = true
    dynamic var reminderEvent:Bool = false
    dynamic var startTitle:String = "Starts"

    var days : [ EKRecurrenceDayOfWeek ]? = []
    var biweekly : Bool = false
    var rules : [EKRecurrenceRule] = []
    var alarms : [EKAlarm] = []
    
    var pWindowController: PopUpWindowController?
    
    var alarmValues : [ String : Int ] = [ "none" : -1 , "At time of event" : 0 , "5 minutes before" : 5 , "15 minutes before" : 15 , "1 hour before" : 60 ]
    var alarmDisplayStrings : [String] = [ "none" , "At time of event"  , "5 minutes before"  , "15 minutes before"  , "1 hour before"  ]
    
    override func windowDidLoad() {
        
        super.windowDidLoad()
//        NotificationCenter.default.post(name: Notification.Name("RemoveAgendaView"), object: nil)
 // 3th June .
        let eventStore = EKEventStore();
        let calendars : NSArray = eventStore.calendars(for: EKEntityType.event) as NSArray
        
        for case let cal as EKCalendar in calendars {
            let item : NSString = cal.title as NSString
            if(item.isEqual(to: "Home") || item.isEqual(to: "Work")){
           calendarOutlet.addItem(withObjectValue: item)
            }
        }
        calendarOutlet.stringValue = eventStore.defaultCalendarForNewEvents.title
        
        ///////////////////

        alertOutlet.addItems(withObjectValues: alarmDisplayStrings)
        alertOutlet.stringValue = alertOutlet.itemObjectValue(at: 0) as! String
        
        //////////////////
        
        repeatOutlet.addItem(withObjectValue: "none")
        repeatOutlet.addItem(withObjectValue: "Daily")
        repeatOutlet.addItem(withObjectValue: "Weekly")
        repeatOutlet.stringValue = "none"
        self.SetDate();
    }

    @IBAction func startDateChanged(_ sender: Any) {
//        if (allDayEvent == true) {
            let startDate = startDateOutlet.dateValue
            var calendar = NSCalendar.current,
            components = calendar.dateComponents([.day,.month,.year], from: startDate)
            components.hour = 0
            components.minute = 0
            components.second = 0
            components.day = components.day! + 1;
            let endDate = calendar.date(from: components)!
            endDateOutlet.dateValue = endDate

//        }
    }
    
    func SetDate(_ date:Date = Date()) -> Void {
        let startDate = date
        var calendar = NSCalendar.current,
            components = calendar.dateComponents([.day,.month,.year], from: startDate)
        components.hour = 0
        components.minute = 0
        components.second = 0
        components.day = components.day! + 1;

        let endDate = calendar.date(from: components)!
        startDateOutlet.dateValue = startDate
        endDateOutlet.dateValue = endDate
    }
    
    func setRuleForEvent( _ rules : [EKRecurrenceRule])
    {
        if(rules.isEmpty == false )
        {
            let rule = rules[0]
            
            if(rule.frequency == .daily)
            {
                repeatOutlet.stringValue = "Daily"
                
            }
            else  if(rule.frequency == .weekly)
            {
                repeatOutlet.stringValue = "Weekly"
                if (rule.interval == 2)
                {
                    biweekly = true
                }
//                 days = rule.daysOfTheWeek!
            }
            
           
        }
        
    }
    
    func setAlarmForEvent( _ alarms : [EKAlarm])
    {
        if(alarms.isEmpty == false)
        {
            let alarm = alarms[0]
            let offset = alarm.relativeOffset / 60
            
            switch (offset)
            {
            case 0 : alertOutlet.stringValue = "At time of event"
            case 5 : alertOutlet.stringValue = "5 minutes before"
            case 15 : alertOutlet.stringValue = "15 minutes before"
            case 60 : alertOutlet.stringValue = "1 hour before"
            default : alertOutlet.stringValue = "none"
            }
        }

        
    }
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        
        
        let comboBox: NSComboBox = (notification.object as? NSComboBox)!
        
//        5th June : this code is not needed for main object.
        
//         print("\(comboBox.objectValueOfSelectedItem)")
//         print("\((comboBox.objectValueOfSelectedItem? as AnyObject).stringValue)")

//         print("\(comboBox.identifier)")
        
        if ((comboBox.identifier! == "repeatComboBox") && (comboBox.objectValueOfSelectedItem! as! String == "Weekly"))
        {
            
            pWindowController =  PopUpWindowController(windowNibName: "PopUpWindowController");
            
            let windowTopLeftPosition = CGPoint(x: self.window!.frame.minX + repeatOutlet.frame.minX , y: self.window!.frame.minY + repeatOutlet.frame.minY)
            
            pWindowController!.WindowPos = windowTopLeftPosition
            pWindowController!.createEventRef = self
            pWindowController!.window!.setFrameTopLeftPoint(windowTopLeftPosition)
     ///  5th June convert swift 3.0.
            
            self.window!.beginSheet(pWindowController!.window!, completionHandler: {responseCode  in
                if (responseCode == NSModalResponseOK)
                {
                    print("NSModalResponseOK")
                    
                }
                else if (responseCode == NSModalResponseCancel)
                {
                    print("NSModalResponseCancel")
                }
                else
                {
                    print("Other")
                }
                
            })
        }
       
        // CreateEventWindow.endSheet(pWindowController.window!)
        //WeekOptionsView.hidden = false
        
    }

     func WeeklyPopUpOKPressed(_ sender: AnyObject) {
        
        
        if(pWindowController!.biWeeklyCheckBox.state == 1)
        {
            biweekly = true
        }
        else
        {
            biweekly = false
        }
        
        if(pWindowController!.monButton.state == 1)
        {
            days?.append(EKRecurrenceDayOfWeek(.monday))
 
        }
    
        if(pWindowController!.tueButton.state == 1)
        {
            days?.append(EKRecurrenceDayOfWeek(.tuesday))
        }
        
        if(pWindowController!.wedButton.state == 1)
        {
            days?.append(EKRecurrenceDayOfWeek(.wednesday))
        }
        if(pWindowController!.thuButton.state == 1)
        {
            days?.append(EKRecurrenceDayOfWeek(.thursday))
        }
        if(pWindowController!.friButton.state == 1)
        {
            days?.append(EKRecurrenceDayOfWeek(.friday))
        }
        if(pWindowController!.satButton.state == 1)
        {
            days?.append(EKRecurrenceDayOfWeek(.saturday))
        }
        if(pWindowController!.sunButton.state == 1)
        {
            days?.append(EKRecurrenceDayOfWeek(.sunday))
        }
        
        
    }
    
    func WeeklyPopUpCancelPressed(_ sender: AnyObject) {
        self.repeatOutlet.stringValue = self.repeatOutlet.itemObjectValue(at: 0) as! String
    }
     
    @IBAction func createEvent(_ sender: AnyObject) {
        
        let eventStore = EKEventStore();
        var type = EKEntityType.event;
        if true == reminderEvent {
            type = EKEntityType.reminder
        }
        let calendars : NSArray = eventStore.calendars(for: type) as NSArray
        var _calendar : EKCalendar

        // 2
        let calendarTitle = calendarOutlet.stringValue
         let predicate =  NSPredicate(format:"title matches %@", calendarTitle)
        var filtered = calendars.filtered(using: predicate)
        
        if (filtered.count > 0) {
            _calendar = filtered[0] as! EKCalendar
            print(_calendar.title)
            
            if true == self.reminderEvent {
                
                saveReminder(calendar: _calendar, inStore: eventStore)
            }
            else{
                
                saveEvent(calendar: _calendar, inStore: eventStore)
            }
            
        } else {
            
            print("Error: Calendar not found!")
        }

        self.window?.close()
        /// June 14th notification post.
       let customNotificationName = Notification.Name("CreatEventNoti")
        NotificationCenter.default.post(name: customNotificationName, object: nil, userInfo: nil)
    }
    
    func saveReminder( calendar:EKCalendar, inStore eventStore:EKEventStore)  {
        
        let newEvent = EKReminder(eventStore: eventStore)
        
        newEvent.calendar = calendar
        newEvent.title = eventNameOutlet.stringValue
//        newEvent.startDateComponents = startDateOutlet.dateValue.dateComponents()
        newEvent.dueDateComponents = startDateOutlet.dateValue.dateComponents()
        
        if( repeatOutlet.stringValue == "Daily")
        {
            newEvent.addRecurrenceRule(EKRecurrenceRule(recurrenceWith: .daily, interval: 1, daysOfTheWeek: nil, daysOfTheMonth: nil, monthsOfTheYear: nil, weeksOfTheYear: nil, daysOfTheYear: nil, setPositions: nil, end: nil))
            
        }
        else if (repeatOutlet.stringValue == "Weekly" ){
            
            var interval = 1;
            
            if(biweekly == true)
            {
                interval = 2
            }
            
            newEvent.addRecurrenceRule((EKRecurrenceRule(recurrenceWith: .weekly, interval: interval, daysOfTheWeek: days, daysOfTheMonth: nil, monthsOfTheYear: nil, weeksOfTheYear: nil, daysOfTheYear: nil, setPositions: nil, end: nil)))
        }
        
        if(alertOutlet.stringValue != "none" )
        {
            var offset : TimeInterval = 0
            
            if(alertOutlet.stringValue == "At time of event"){
                offset = 0
            }
            else if (alertOutlet.stringValue == "5 minutes before"){
                offset = 5
            }
            else if (alertOutlet.stringValue == "15 minutes before"){
                offset = 15
            }
            else if (alertOutlet.stringValue == "1 hour before"){
                offset = 60
            }
            
            offset = offset * 60
            
            if (  newEvent.alarms?.isEmpty == true)
            {
                newEvent.alarms = [EKAlarm]()
            }
            
            newEvent.addAlarm(EKAlarm(relativeOffset: offset))
            
            
        }
        // Save the calendar using the Event Store instance
        
        do {
            
            try eventStore.save(newEvent, commit: true)
//            try eventStore.save(newEvent, span: .thisEvent, commit: true)
            /* delegate?.eventDidAdd()
             
             self.dismissViewControllerAnimated(true, completion: nil)*/
        } catch {
            let err = error as NSError
            //                let details = err.localizedDescription
            //                let alert = NSAlert(title: "Event could not save", message: details, preferredStyle: .Alert)
            NSApp.presentError(err)
            print("\((error as NSError).localizedDescription)")

        }
        
    }
    
    func saveEvent( calendar:EKCalendar, inStore eventStore:EKEventStore)  {
        
        let newEvent = EKEvent(eventStore: eventStore)
        
        newEvent.calendar = calendar
        newEvent.title = eventNameOutlet.stringValue
        newEvent.startDate = startDateOutlet.dateValue
        newEvent.endDate = endDateOutlet.dateValue
        
        if( repeatOutlet.stringValue == "Daily")
        {
            newEvent.recurrenceRules?.append(EKRecurrenceRule(recurrenceWith: .daily, interval: 1, daysOfTheWeek: nil, daysOfTheMonth: nil, monthsOfTheYear: nil, weeksOfTheYear: nil, daysOfTheYear: nil, setPositions: nil, end: nil))
            
        }
        else if (repeatOutlet.stringValue == "Weekly" ){
            
            var interval = 1;
            
            if(biweekly == true)
            {
                interval = 2
            }
            
            newEvent.addRecurrenceRule((EKRecurrenceRule(recurrenceWith: .weekly, interval: interval, daysOfTheWeek: days, daysOfTheMonth: nil, monthsOfTheYear: nil, weeksOfTheYear: nil, daysOfTheYear: nil, setPositions: nil, end: nil)))
        }
        
        if(alertOutlet.stringValue != "none" )
        {
            var offset : TimeInterval = 0
            
            if(alertOutlet.stringValue == "At time of event"){
                offset = 0
            }
            else if (alertOutlet.stringValue == "5 minutes before"){
                offset = 5
            }
            else if (alertOutlet.stringValue == "15 minutes before"){
                offset = 15
            }
            else if (alertOutlet.stringValue == "1 hour before"){
                offset = 60
            }
            
            offset = offset * 60
            
            if (  newEvent.alarms?.isEmpty == true)
            {
                newEvent.alarms = [EKAlarm]()
            }
            
            newEvent.addAlarm(EKAlarm(relativeOffset: offset))
            
            
        }
        // Save the calendar using the Event Store instance
        do {
            try eventStore.save(newEvent, span: .thisEvent, commit: true)
            /* delegate?.eventDidAdd()
             
             self.dismissViewControllerAnimated(true, completion: nil)*/
        } catch {
            let err = error as NSError
            //                let details = err.localizedDescription
            //                let alert = NSAlert(title: "Event could not save", message: details, preferredStyle: .Alert)
            NSApp.presentError(err)
            print("\((error as NSError).localizedDescription)")
        }
        
    }
    
    @IBAction func remiderSelectionDidChanged(_ sender: Any) {
        
        let eventStore = EKEventStore();
        let calendars : NSArray?
        calendarOutlet.removeAllItems()
        
        if (true == reminderEvent) {
            
            calendars = eventStore.calendars(for: EKEntityType.reminder) as NSArray
            calendarOutlet.stringValue = eventStore.defaultCalendarForNewReminders().title
            startTitle = "Due At"
            for case let cal as EKCalendar in calendars! {
                let item : NSString = cal.title as NSString
                calendarOutlet.addItem(withObjectValue: item)
            }
        }
        else{
            calendars = eventStore.calendars(for: EKEntityType.event) as NSArray
            calendarOutlet.stringValue = eventStore.defaultCalendarForNewEvents.title
            startTitle = "Starts"
            for case let cal as EKCalendar in calendars! {
                let item : NSString = cal.title as NSString
                if(item.isEqual(to: "Home") || item.isEqual(to: "Work")){
                    calendarOutlet.addItem(withObjectValue: item)
                }
            }
        }
        
//        for case let cal as EKCalendar in calendars! {
//            let item : NSString = cal.title as NSString
//            calendarOutlet.addItem(withObjectValue: item)
//        }

    }

}

extension Date{
    func dateComponents() -> DateComponents {
        
        let calendarUnitFlags: NSCalendar.Unit = [.year, .month, .day, .hour, .minute, .second,.timeZone]
        let components = (Calendar.current as NSCalendar).components(calendarUnitFlags, from: self)
        return components
    }
}
