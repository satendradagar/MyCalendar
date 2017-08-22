//
//  EventWindowController.swift
//  calendar
//
//  Created by nidhi on 4/25/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa

class EventWindowController: NSWindowController, NSTableViewDelegate ,NSTableViewDataSource {

    @IBOutlet  var eventDateLabelOutlet: NSTextField!
    @IBOutlet  var eventDataTableOutlet: NSTableView!

    @IBOutlet var eventDetailsWindowOutlet: NSWindow!
    var style: NSTableViewColumnAutoresizingStyle!

    
    var calendarDataInstane = CalendarData.sharedInstance
    
    let createEventWindowController = CreateEvent(windowNibName: "CreateEvent")


       override func windowDidLoad() {
        super.windowDidLoad()
       
//        NotificationCenter.default.post(name: Notification.Name("RemoveAgendaView"), object: nil)
        eventDataTableOutlet.columnAutoresizingStyle  = .uniformColumnAutoresizingStyle;
        
      
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        eventDetailsWindowOutlet.isOpaque = false
        eventDetailsWindowOutlet.backgroundColor = NSColor.clear
        
        // June 4 th
        eventDetailsWindowOutlet.styleMask  =   [.resizable,.titled,.fullSizeContentView]
        
//        eventDetailsWindowOutlet.styleMask  =   NSResizableWindowMask | NSTitledWindowMask |  NSFullSizeContentViewWindowMask

        eventDetailsWindowOutlet.backgroundColor   =   NSColor.white
        eventDetailsWindowOutlet.isOpaque  =   false
        
        //  4th June
        
        eventDetailsWindowOutlet.styleMask  = [.resizable,.titled,.fullSizeContentView]
//        eventDetailsWindowOutlet.styleMask                   =   NSResizableWindowMask
//            |   NSTitledWindowMask
//            |   NSFullSizeContentViewWindowMask
        eventDetailsWindowOutlet.isMovableByWindowBackground   =   true
        eventDetailsWindowOutlet.titlebarAppearsTransparent  =   true
        eventDetailsWindowOutlet.titleVisibility             =   .hidden
        eventDetailsWindowOutlet.showsToolbarButton          =   false
        eventDetailsWindowOutlet.standardWindowButton(NSWindowButton.fullScreenButton)?.isHidden   =   true
        eventDetailsWindowOutlet.standardWindowButton(NSWindowButton.miniaturizeButton)?.isHidden  =   true
        eventDetailsWindowOutlet.standardWindowButton(NSWindowButton.closeButton)?.isHidden        =   true
        eventDetailsWindowOutlet.standardWindowButton(NSWindowButton.zoomButton)?.isHidden         =   true
        
        let  contentView = self.eventDetailsWindowOutlet.contentView;
        
        contentView!.wantsLayer = true;
        contentView!.layer!.backgroundColor = NSColor.windowBackgroundColor.cgColor;
        contentView!.layer!.masksToBounds = true;
        
        contentView!.layer!.cornerRadius = 15.0;
        
    }

    
    @IBAction func doubleClickAction(_ sender: AnyObject) {
    
        let button : NSTableView = sender as! NSTableView
        
        let eventFrame = NSApp.currentEvent!.window!.frame
        let eventOrigin = eventFrame.origin;
        let eventSize = eventFrame.size;
        
        // Calculate the position of the window to
        // place it centered below
        let windowFrame = button.window!.frame;
        let windowSize = windowFrame.size;
        let windowTopLeftPosition = CGPoint(x: eventOrigin.x + eventSize.width/2.0 - windowSize.width/2.0, y: eventOrigin.y - 5);
        
        // Set position of the window and display it
        createEventWindowController.window?.setFrameTopLeftPoint(windowTopLeftPosition);
        print("\(eventDataTableOutlet.clickedRow)")
        
        let iden = calendarDataInstane.userSelectedDateIdentifier
        var indexes = iden.characters.split{$0 == "-"}.map(String.init)
        let calendarRow = Int(indexes[0])!
        let calendarCol = Int(indexes[1])!

        let calCell = calendarDataInstane.selectedMonthCalArray[calendarRow][calendarCol]
        let event = calCell.events[eventDataTableOutlet.clickedRow].event
        // 4th June 
        _ = event.startDate
        _ = event.endDate

        createEventWindowController.eventNameOutlet.stringValue = event.title
        
//        createEventWindowController.LocationOutlet.stringValue = "dfsdf"
        
        createEventWindowController.startDateOutlet.dateValue = event.startDate
        createEventWindowController.endDateOutlet.dateValue =  event.endDate
        if(event.recurrenceRules?.isEmpty == false ){
            createEventWindowController.rules = event.recurrenceRules!
        }
        if(event.alarms?.isEmpty == false)
        {
            createEventWindowController.alarms = event.alarms!
            print(event.alarms as Any)
        }

        if(event.recurrenceRules?.isEmpty == false){
            createEventWindowController.setRuleForEvent(event.recurrenceRules!)
        }
        if(event.alarms?.isEmpty == false){
            createEventWindowController.setAlarmForEvent(event.alarms!)
        }
        createEventWindowController.window?.makeKeyAndOrderFront(sender)
        createEventWindowController.showWindow(sender)
        createEventWindowController.calendarOutlet.stringValue  = event.calendar.title
        
       
    }
 

    func setData( _ data : String)
    {
        eventDateLabelOutlet.stringValue = data as String
         eventDataTableOutlet.reloadData()
    }
    
    func setWindowPosRelativeToFrame(_ CalendarWindowFrame : NSRect)
    //func setWindowPosRelativeToFrame(CalendarWindowFrameOrigin : NSPoint)
    {
      let windowTopLeftPosition = CGPoint(x: (CalendarWindowFrame.minX) - 100  , y: CalendarWindowFrame.maxY-20);
        
       eventDetailsWindowOutlet.setFrameTopLeftPoint(windowTopLeftPosition)
       // eventDetailsWindowOutlet.setFrameTopLeftPoint(CalendarWindowFrameOrigin)
        
        var iden = CalendarData.sharedInstance.userSelectedDateIdentifier
        var indexes = iden.characters.split{$0 == "-"}.map(String.init)
        let calendarRow = Int(indexes[0])!
        let calendarCol = Int(indexes[1])!
        
        let calCell = CalendarData.sharedInstance.selectedMonthCalArray[calendarRow][calendarCol]
       
        var components = DateComponents()
        components.day = calCell.day
        components.month = calCell.month
        components.year = calCell.year
    
         let date : Date = Calendar.current.date(from: components)!
        
        let dateFormatter: DateFormatter = DateFormatter()
        
        /// june 27 
        
        let defaults = UserDefaults.standard
        let buttonIndex_changeDateFormatter = defaults.integer(forKey: "agendaHeaderFormat")
        
        if buttonIndex_changeDateFormatter == 1 {
            dateFormatter.dateFormat = "EEEE, MMMM dd "
            
        }
        
        if buttonIndex_changeDateFormatter == 0 {
            dateFormatter.dateFormat = "EEEE, dd MMMM "
        }
               eventDateLabelOutlet.stringValue = dateFormatter.string(from: date)
        

    }
    
    override func showWindow(_ sender: Any?) {
        super.showWindow(sender)
     NSAnimationContext.runAnimationGroup({ (context) -> Void in
            
            
            context.duration = 0.1
            //self.ScrollView1.animator().constant = //negative width of scroll view
            //self.ScrollView2.animator().constant = 0
            self.eventDetailsWindowOutlet!.animator().setFrame(self.eventDetailsWindowOutlet!.frame.offsetBy(dx: -self.eventDetailsWindowOutlet.frame.size.width - 130, dy: 0), display: true);
            }, completionHandler: { () -> Void in
                //insert any finalizing actions here
                print("Animation Done")
        })
        

       
    }
    func closeWindow() {
        self.eventDetailsWindowOutlet!.orderOut(self)

    }
    @IBAction func btn_CloseAgenda(_ sender: Any) {
        //        calendarTable.removeAgendaView(sender)
         NotificationCenter.default.post(name: Notification.Name("RemoveAgendaView"), object: nil)
        self.closeWindow()

    }
}
