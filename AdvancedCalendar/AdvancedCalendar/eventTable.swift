//
//  eventTable.swift
//  calendar
//
//  Created by nidhi on 4/25/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa

open class eventTable: NSObject , NSTableViewDataSource,NSTableViewDelegate{
    
    var eventDate: NSString = ""
    var calendarDataInstane = CalendarData.sharedInstance
    var calendarRow = 0
    var calendarCol = 0
    
   
    
    func setEventDateValue( _ date: NSString)
    {
        eventDate = date
        tableView.columnAutoresizingStyle  = .uniformColumnAutoresizingStyle;
         NotificationCenter.default.post(name: Notification.Name("RemoveAgendaView"), object: nil)
        tableView .reloadData()
        
    }
    open func numberOfRows(in aTableView: NSTableView) -> Int{
        
        var iden = calendarDataInstane.userSelectedDateIdentifier
        var indexes = iden.characters.split{$0 == "-"}.map(String.init)
        calendarRow = Int(indexes[0])!
        calendarCol = Int(indexes[1])!
        
        return  calendarDataInstane.selectedMonthCalArray[calendarRow][calendarCol].events.count
        
    }
    @IBOutlet weak var tableView: NSTableView!
    
 
    
    open func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let indexOfColumn = tableView.tableColumns.index(of: tableColumn!)
        
        let calCell = calendarDataInstane.selectedMonthCalArray[calendarRow][calendarCol]
        let event = calCell.events[row].event
        let startDate = event.startD
        let endDate = event.endD
//        if let startDate = event.startD {
//
//        }
//        if let endDate = event.endD {
//
//        }
//        let components =  durationComponents(startDate, endDate: endDate)
        
        var cellView : NSTableCellView
        
        if ( indexOfColumn == 0 )
        {
            cellView = tableView.make(withIdentifier: "bulletView", owner: self) as! NSTableCellView
            
            //cellView.textField?.stringValue = "\(calendarDataInstane.selectedMonthCalArray[calendarRow][calendarCol].events[row].title )"
           
            return cellView
        }
        else if ( indexOfColumn == 1 )
        {
            cellView = tableView.make(withIdentifier: "eventTitleView", owner: self) as! NSTableCellView
            
            cellView.textField?.stringValue = "\(event.title )"
            cellView.textField?.toolTip = event.title
            return cellView
        }
        else if ( indexOfColumn == 2 )
        {
            cellView = tableView.make(withIdentifier: "eventDetailsView", owner: self) as! NSTableCellView
            
            if( startDate != nil) {
                let dateFormatter: DateFormatter = DateFormatter()
                if (PreferencesStore.sharedInstance.agendaTimeFormat == 0) {
                    dateFormatter.dateFormat = "hh:mm a"
                }
                else if(PreferencesStore.sharedInstance.agendaTimeFormat == 1){
                    dateFormatter.dateFormat = "HH:mm"
                }
                cellView.textField?.stringValue = "\( dateFormatter.string(from: event.startD!))"
            }
            else{
                cellView.textField?.stringValue = ""

            }
            return cellView
        
        }
        else if ( indexOfColumn == 3 )
        {
            cellView = tableView.make(withIdentifier: "eventDetailsView", owner: self) as! NSTableCellView
            
            if( nil != endDate) {
                let dateFormatter: DateFormatter = DateFormatter()
                if (PreferencesStore.sharedInstance.agendaTimeFormat == 0) {
                    dateFormatter.dateFormat = "hh:mm a"
                }
                else if(PreferencesStore.sharedInstance.agendaTimeFormat == 1){
                    dateFormatter.dateFormat = "HH:mm"
                }
                
                cellView.textField?.stringValue = "\( dateFormatter.string(from: event.endD!))"
            }
            else{
                cellView.textField?.stringValue = ""

            }
            return cellView
            
        }
        else if ( indexOfColumn == 4 )
        {
            cellView = tableView.make(withIdentifier: "eventDurationView", owner: self) as! NSTableCellView
            if nil != startDate && nil != endDate {
                cellView.textField?.stringValue = duration( startDate! , endDate:endDate! )
   
            }
            else
            {
                cellView.textField?.stringValue = ""
            }
            
                return cellView
            
        }

        return nil
    }
    func doubleClickOnResultRow( _ sender : AnyObject )
    {
          }
    func durationComponents(_ startDate: Date , endDate : Date) -> DateComponents
    {
      
        let unitFlags: NSCalendar.Unit = [ .year , .month , .day , .hour , .minute]
        
        let components =  (Calendar.current as NSCalendar).components( unitFlags , from: startDate, to : endDate , options: NSCalendar.Options(rawValue: 0))
        
        return components
    }
    
    func duration (_ startDate: Date , endDate : Date) -> String
    {
        var duration : String = " "
        
        
        let components =  durationComponents(startDate, endDate: endDate)
        var isLongDuration = true
        // 7th June
        
        if (components.year! > 0 )
        {
//            duration = duration + "\(String(describing: components.year)) year(s)"
            var year : NSInteger = 0
            var yearString : NSString = ""
            year = components.year!
            yearString = String(year) as NSString
            duration = duration + "\(String(yearString))y "
//            isLongDuration = true
        }
        
        if (components.month! > 0 )
        {
//            duration = duration + "\(String(describing: components.month)) month(s)"
            var month : NSInteger = 0
            var monthString : NSString = ""
            month = components.month!
            monthString = String(month) as NSString
            duration = duration + "\(String(monthString))m "
//            isLongDuration = true
        }
        
        if (components.day! > 0 )
        {
            var day :NSInteger = 0
            var daystring :NSString = " "
//            duration =  "\(String(describing: components.day)) day"
            
            day = components.day!
            var suffix = "day"
            if isLongDuration == true {
                suffix = "d "
            }
            daystring = String(day) as NSString
            duration = duration + "\(String(daystring))\(suffix)"
        
        }

        if (components.hour! > 0 )
        {
//            duration = duration + "\(String(describing: components.hour)) hour(s)"
            var hour : NSInteger = 0
            var hourString :NSString = " "
            hour = components.hour!
            
            var suffix = "hour"
            if isLongDuration == true {
                suffix = "h "
            }
            hourString = String(hour) as NSString
            duration = duration + "\(String(hourString))\(suffix)"
        }
        
        if (components.minute! > 0 )
        {
//            duration = duration + "\(String(describing: components.minute)) minute(s)"
            var minute : NSInteger = 0
            var minuteString : NSString = ""
            minute = components.minute!
            
            var suffix = "minute"
            if isLongDuration == true {
                suffix = "m "
            }
            minuteString = String(minute) as NSString
            duration = duration + "\(String(minuteString))\(suffix)"
        }

        return duration
    }

}


