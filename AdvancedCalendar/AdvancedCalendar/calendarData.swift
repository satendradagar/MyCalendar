//
//  CalendarData.swift
//  calendar
//
//  Created by nidhi on 4/26/17.
//  Copyright © 2017 nidhi. All rights reserved.
//



import Cocoa

import EventKit



//private let _SingletonSharedInstance = EventStore()
//
//class EventStore {
//    let eventStore = EKEventStore ()
//    
//    class var sharedInstance : EventStore {
//        return _SingletonSharedInstance
//    }
//    
//    init() {
//        
//        let sema = DispatchSemaphore(value: 0)
//        var hasAccess = false
//        
//        eventStore.requestAccess(to: EKEntityType.event, completion: { (granted:Bool, error:NSError?) in hasAccess = granted; sema.signal() } as! EKEventStoreRequestAccessCompletionHandler)
//        
////        sema.wait(timeout: DispatchTime.distantFuture)
//      
//        if (!hasAccess) {
//            let myPopup: NSAlert = NSAlert()
//            myPopup.messageText = "Access Denied!"
//            myPopup.informativeText = "Please allow access to calendars app"
//            myPopup.alertStyle = NSAlertStyle.warning
//            myPopup.addButton(withTitle: "OK")
//            myPopup.runModal()
//            let sharedWorkspace = NSWorkspace.shared()
//            sharedWorkspace.openFile("/Applications/System Preferences.app")
//        }
//        authorizedReminder()
//
//    }
//    
//   func authorizedReminder() {
//        
//        let sema = DispatchSemaphore(value: 0)
//        var hasAccess = false
//        
//        eventStore.requestAccess(to: EKEntityType.reminder, completion: { (granted:Bool, error:NSError?) in hasAccess = granted; sema.signal() } as! EKEventStoreRequestAccessCompletionHandler)
//        
//        //        sema.wait(timeout: DispatchTime.distantFuture)
//        
//        if (!hasAccess) {
//            let myPopup: NSAlert = NSAlert()
//            myPopup.messageText = "Access Denied!"
//            myPopup.informativeText = "Please allow access to Reminders app"
//            myPopup.alertStyle = NSAlertStyle.warning
//            myPopup.addButton(withTitle: "OK")
//            myPopup.runModal()
//            let sharedWorkspace = NSWorkspace.shared()
//            sharedWorkspace.openFile("/Applications/System Preferences.app")
//        }
//    }
//
//}

// EVENT TYPE

let REMINDER = 1
let EVENT = 2
let BIRTHDAY = 3

class calendarEventItem{
    var type: Int = 0
    var event: EKCalendarItem = EKCalendarItem()
}

class calendarCell{
    var day :Int = 0
    var month: Int = 0
    var year: Int = 0
    var events: [calendarEventItem] = []
}

class CalendarData: NSObject {
    
    static let sharedInstance = CalendarData()
     var prefStore = PreferencesStore.sharedInstance
    
    var selectedMonthCalArray = [[calendarCell]](repeating: [calendarCell](repeating: calendarCell(), count: WEEK_DAYS_COLUMN), count: WEEK_ROWS_IN_CALENDAR)
    var firstDateOfSelectedMonth = Date()
    var dateToday =  Date()
    var userSelectedDateIdentifier = ""
    var selectedMonth = -1
    var selectedYear = -1
    var calDays = ["", "Sunday","Monday" , "Tuesday" , "Wednesday", "Thursday" , "Friday" , "Saturday"]
    
    fileprivate override init() {
        
        super.init()
        
        let unitFlags: NSCalendar.Unit = [.day, .month, .year]
        var components = (Calendar.current as NSCalendar).components(unitFlags, from: dateToday)
        selectedMonth = components.month!
        selectedYear = components.year!

        
        //  5th June. return string.
        
        userSelectedDateIdentifier = "\(String(describing: components.day))-\(String(describing: components.month))"
        components.day = 1
        firstDateOfSelectedMonth  = Calendar.current.date(from: components)!
        
        layoutCalendar()
        
    }
    
    func loadCalendarData() -> Void {
        let unitFlags: NSCalendar.Unit = [.day, .month, .year]
        var components = (Calendar.current as NSCalendar).components(unitFlags, from: dateToday)
        selectedMonth = components.month!
        selectedYear = components.year!
        
        
        //  5th June. return string.
        
        userSelectedDateIdentifier = "\(String(describing: components.day))-\(String(describing: components.month))"
        components.day = 1
        firstDateOfSelectedMonth  = Calendar.current.date(from: components)!
        
        layoutCalendar()
    }
    
    func numberOfDaysInCurrentMonth()-> Int  {
        
        let daysRange = (Calendar.current as NSCalendar).range(of: .day, in: .month, for: firstDateOfSelectedMonth)
        return daysRange.length;
        
    }
    
    func numberOfDaysInPreviousMonth()-> Int {
        
        let unitFlags: NSCalendar.Unit = [.day, .month, .year]
        var components = (Calendar.current as NSCalendar).components(unitFlags, from: firstDateOfSelectedMonth)
        components.month = components.month! - 1
        if components.month == 0{
            components.month = 12
            components.year = components.year! - 1
        }
        
        let prevMonthDate = Calendar.current.date(from: components)
        
        let daysRange = (Calendar.current as NSCalendar).range(of: .day, in: .month, for: prevMonthDate!)
        
        return daysRange.length ;
        
    }
    
    func startDateForFirstRow()-> Int {
        
        let startDate =  numberOfDaysInPreviousMonth() - firstDayOfMonth() - 1
        return startDate
    }
    
    func firstDayOfMonth()-> Int {
        
        // 4th June .
        

        let unitFlags = Set<Calendar.Component>([.day,.month,.year])
        let components = Calendar.current.dateComponents(unitFlags, from: firstDateOfSelectedMonth)
        let firstDate = Calendar.current.date(from: components)
        
        let weekday = Calendar.current.component(.weekday, from: firstDate!)
        
        return weekday
        
    }
    
    
    func layoutCalendar(){
        
        //June 18th.
        
        let daysInPreviousMonth = numberOfDaysInPreviousMonth()
        let firstDay = firstDayOfMonth()
        let lastDayMod = numberOfDaysInCurrentMonth() + 1
        
        //  5th June for index return.
        var weekDayIndex = 0 ;
        
        var month = selectedMonth
        var year = selectedYear
        
        let firstDayOfWeek =  prefStore.firstDayOfWeek ;
       
        let indexOffirstDayOfWeek = calDays.index(of: firstDayOfWeek!)
        
        //if firstDay != 2 // Monday is not the first day
        if firstDay != indexOffirstDayOfWeek
        {
            
//            ?June 14th
//            var prevMonthStartMonth = daysInPreviousMonth - (firstDay-3)
            var prevMonthStartMonth : Int
            
            prevMonthStartMonth = daysInPreviousMonth - (firstDay - indexOffirstDayOfWeek! - 1)
            
            /*
            if((8 - indexOffirstDayOfWeek!) == 7)
            {
                // June 19th the general formular for correct calendar data.
                //     prevMonthStartMonth = daysInPreviousMonth
                prevMonthStartMonth = daysInPreviousMonth - (firstDay - indexOffirstDayOfWeek! - 1)
            }
            else
            {
                // June 17th

                 prevMonthStartMonth = daysInPreviousMonth - (firstDay - indexOffirstDayOfWeek! - 1)

              prevMonthStartMonth = daysInPreviousMonth - (8 - firstDay - indexOffirstDayOfWeek! + 1)
            }*/
    
            var yearChanged = false
            month = month - 1
            if month == 0
            {
                yearChanged = true
                month = 12
                year = year - 1
            }
            
            if prevMonthStartMonth <= daysInPreviousMonth {
                
                for _ in prevMonthStartMonth ... daysInPreviousMonth {
                    
                    let cell = calendarCell()
                    cell.day = prevMonthStartMonth ;
                    cell.month = month
                    cell.year = year
                    // 3th June
                    selectedMonthCalArray[0][weekDayIndex] = cell
                    weekDayIndex += 1
                    prevMonthStartMonth += 1
                }
            }
            
            month = month + 1
            if yearChanged == true {
                year = year + 1
            }
        }
        
        var monthStartDate = 1
        for _ in weekDayIndex ... (WEEK_DAYS_COLUMN - 1 ) {
            
            let cell = calendarCell()
            //3th June
            cell.day = monthStartDate
            cell.month = month
            cell.year = year
            monthStartDate += 1
            
            //3th June
            selectedMonthCalArray[0][weekDayIndex] = cell
            weekDayIndex += 1
        }
        
        for rowWeekIndex in 1 ... (WEEK_ROWS_IN_CALENDAR - 1 ) {
            for index in 0 ... (WEEK_DAYS_COLUMN - 1 ) {
                
                let cell = calendarCell()
                
                //3th June
                cell.day = monthStartDate
                cell.month = month
                cell.year = year
                
                monthStartDate += 1
                
                selectedMonthCalArray[rowWeekIndex][index] = cell
                
                if monthStartDate == lastDayMod {
                    monthStartDate = 1
                    month = month + 1
                    
                    if month == 13{
                        month = 1
                        year = year + 1
                    }
                }
//                monthStartDate += 1
            }
        }
        
        getAllEvents()
        getAllRemindersEvents()
        
    }
    
    func showPreviousMonth(_ sender: AnyObject) {
        
        let unitFlags: NSCalendar.Unit = [.day, .month, .year]
        var components = (Calendar.current as NSCalendar).components(unitFlags, from: firstDateOfSelectedMonth)
        components.month = components.month! - 1
        if components.month == 0{
            components.month = 12
            components.year = components.year! - 1
        }
        selectedMonth = components.month!
        selectedYear = components.year!
        
        firstDateOfSelectedMonth  = Calendar.current.date(from: components)!
        
        layoutCalendar()
        
    }
    
    func showNextMonth(_ sender: AnyObject) {
        
        let unitFlags: NSCalendar.Unit = [.day, .month, .year]
        var components = (Calendar.current as NSCalendar).components(unitFlags, from: firstDateOfSelectedMonth)
        components.month = components.month! + 1
        if components.month == 13{
            components.month = 1
            components.year = components.year! + 1
        }
        selectedMonth = components.month!
        selectedYear = components.year!
        
        firstDateOfSelectedMonth  = Calendar.current.date(from: components)!
        layoutCalendar()
        
    }
    
    var hasAccess = false
    
    func getAllEvents()
    {
        let eventStore = EKEventStore ()
        ///  5th June. for the defalt.
        var hasAccess = false
        let sema = DispatchSemaphore(value: 0)
        
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            print("Access Granted")
            hasAccess = true
            break
        case .denied:
            print("Access denied")
            return
        case .notDetermined:
            
            eventStore.requestAccess(to: .event, completion: { (granted, error) in
                
                hasAccess = granted
                
                sema.signal()
            })
            
//            sema.wait(timeout: DispatchTime.distantFuture)
//            sema .wait(timeout: DispatchTime.distantFuture)
            break
        default:
            print("Case Default")
            break
        }
        
        if (!hasAccess) {
          
            let myPopup: NSAlert = NSAlert()
            myPopup.messageText = "Access Denied!"
            myPopup.informativeText = "Please allow access to calendars app"
            myPopup.alertStyle = NSAlertStyle.informational
            myPopup.addButton(withTitle: "OK")
            myPopup.runModal()
            let sharedWorkspace = NSWorkspace.shared()
            sharedWorkspace.openFile("/Applications/System Preferences.app")
            return
        }

        for et in eventStore.calendars(for: EKEntityType.event) {
            
            
            // start Date
            var components = DateComponents();
            
            var calendarCellValue: calendarCell = selectedMonthCalArray[0][0]
            
            components.day = calendarCellValue.day
            components.month = calendarCellValue.month
            components.year = calendarCellValue.year
            
            let startDate =  Calendar.current.date(from: components)!
            
            
            calendarCellValue = selectedMonthCalArray[5][6]
            
            components.day = calendarCellValue.day
            components.month = calendarCellValue.month
            components.year = calendarCellValue.year
            
            let endDate =  Calendar.current.date(from: components)!
            
            let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: [et])
            
            let events = eventStore.events(matching: predicate)
                //14th June
            .sorted {
            $0.startDate.compare($1.startDate) == ComparisonResult.orderedAscending
            }
            // 9th June print log.
            print(components.day!)
            print(components.year!)
            print(components.month!)
            
            addSingleEventsInCalendar(events , type:EVENT)
            
        }
        
    }
    
    func getAllRemindersEvents()
    {
        let eventStore = EKEventStore ()
        ///  5th June. for the defalt.
        var hasAccess = false
        let sema = DispatchSemaphore(value: 0)
        
        switch EKEventStore.authorizationStatus(for: .reminder) {
        case .authorized:
            print("Access Granted")
            hasAccess = true
            break
        case .denied:
            print("Access denied")
            return
        case .notDetermined:
            
            eventStore.requestAccess(to: .reminder, completion: { (granted, error) in
                
                hasAccess = granted
                
                sema.signal()
            })
            
            //            sema.wait(timeout: DispatchTime.distantFuture)
            //            sema .wait(timeout: DispatchTime.distantFuture)
            break
        default:
            print("Case Default")
            break
        }
        
        if (!hasAccess) {
            
            let myPopup: NSAlert = NSAlert()
            myPopup.messageText = "Access Denied!"
            myPopup.informativeText = "Please allow access to Reminders app"
            myPopup.alertStyle = NSAlertStyle.informational
            myPopup.addButton(withTitle: "OK")
            myPopup.runModal()
            let sharedWorkspace = NSWorkspace.shared()
            sharedWorkspace.openFile("/Applications/System Preferences.app")
            return
        }
        
        for et in eventStore.calendars(for: EKEntityType.reminder) {
            
            
            // start Date
            var components = DateComponents();
            
            var calendarCellValue: calendarCell = selectedMonthCalArray[0][0]
            
            components.day = calendarCellValue.day
            components.month = calendarCellValue.month
            components.year = calendarCellValue.year
            
            let startDate =  Calendar.current.date(from: components)!
            
            
            calendarCellValue = selectedMonthCalArray[5][6]
            
            components.day = calendarCellValue.day
            components.month = calendarCellValue.month
            components.year = calendarCellValue.year
            
            let endDate =  Calendar.current.date(from: components)!
            
//            let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: [et])
            let predicate1 = eventStore.predicateForIncompleteReminders(withDueDateStarting: nil, ending: endDate, calendars: [et])
            let predicate2 = eventStore.predicateForCompletedReminders(withCompletionDateStarting: nil, ending: endDate, calendars: [et])
//            let predicate = NSCompoundPredicate.init(orPredicateWithSubpredicates: [predicate1,predicate2])
             eventStore.fetchReminders(matching: predicate1, completion: { (reminders) in
                self.addSingleEventsInCalendar(reminders , type:REMINDER)

            })
            eventStore.fetchReminders(matching: predicate2, completion: { (reminders) in
                self.addSingleEventsInCalendar(reminders , type:REMINDER)
                
            })
            
//            let events = eventStore.fetchRemindersMatchingPredicate(matching: predicate)
                //14th June
//                .sorted {
//                    $0.startDate.compare($1.startDate) == ComparisonResult.orderedAscending
//            }
            // 9th June print log.
//            print(components.day!)
//            print(components.year!)
//            print(components.month!)
//            
//            addSingleEventsInCalendar(events , type:REMINDER)
//            
        }
        
    }
    
       
    func addSingleEventsInCalendar(_ events  : [EKCalendarItem]? , type : Int)
    {
        guard (events != nil) else {
            
            print("Can't add nil objects")
            return
        }
        
        for event in events! {
            
            let startDateComponentsWithoutTime:DateComponents!
            
            let unitFlags: NSCalendar.Unit = [.day, .month, .year]
            if let eventObj = event as? EKEvent{
                
                 startDateComponentsWithoutTime = (Calendar.current as NSCalendar).components(unitFlags, from: eventObj.startDate)
   
            }
            else
            {
                if let eventObj = event as? EKReminder{
                    
                    startDateComponentsWithoutTime = eventObj.startDateComponents
                    
                }
                else{
                    print("Initiating Blank component");
                    startDateComponentsWithoutTime = DateComponents.init()
                }

            }
            
            for rowWeekIndex in 0 ... 5 {
                for colDayIndex in 0 ... 6 {
                    
                    let cell = selectedMonthCalArray[rowWeekIndex][colDayIndex]
                    
                    if ( startDateComponentsWithoutTime.day == cell.day ) &&
                        (startDateComponentsWithoutTime.month == cell.month) &&
                        (startDateComponentsWithoutTime.year == cell.year ) {
                            
                            let calendarEventItemObj = calendarEventItem()
                            calendarEventItemObj.event = event
                            calendarEventItemObj.type = type
                            cell.events.append(calendarEventItemObj)
                            
                    }
                }
            }
        }
    }
    func addEventsInCalendar(_ events  : [EKEvent])
    {
        var calEvents = [EKEvent]()
        
        for event in events {
            
            // print(NSCalendar.currentCalendar())
            let unitFlags: NSCalendar.Unit = [.day, .month, .year]
            var startDateComponentsWithoutTime = (Calendar.current as NSCalendar).components(unitFlags, from: event.startDate)
            print(event.startDate)
            print(startDateComponentsWithoutTime)
            startDateComponentsWithoutTime = (Calendar(identifier: Calendar.Identifier.gregorian) as NSCalendar).components(unitFlags, from: event.startDate)
            print(startDateComponentsWithoutTime)
            var endDateComponentsWithoutTime = (Calendar.current as NSCalendar).components(unitFlags, from: event.endDate)
            startDateComponentsWithoutTime.hour = 0
            startDateComponentsWithoutTime.minute = 0
            startDateComponentsWithoutTime.second = 0
            endDateComponentsWithoutTime.hour = 0
            endDateComponentsWithoutTime.minute = 0
            endDateComponentsWithoutTime.second = 0
            
            
            let startDateWithoutTime = Calendar.current.date(from: startDateComponentsWithoutTime)
            let endDateWithoutTime = Calendar.current.date(from: endDateComponentsWithoutTime)
            
            if(startDateWithoutTime?.compare(endDateWithoutTime!) == ComparisonResult.orderedAscending)
            {
                let subEvent = event
                
                
                var endDateComponents =  (Calendar.current as NSCalendar).components(unitFlags, from: event.startDate)
                
                endDateComponents.year = startDateComponentsWithoutTime.year
                endDateComponents.month = startDateComponentsWithoutTime.month
                endDateComponents.day = startDateComponentsWithoutTime.day
                endDateComponents.hour = 23
                endDateComponents.minute = 59
                endDateComponents.second = 59
                
                var subEventEndDate = Calendar.current.date(from: endDateComponents)
                
                subEvent.startDate = event.startDate
                subEvent.endDate = subEventEndDate!
                
                calEvents.append(subEvent)
                
                var offsetComponents = DateComponents()
                offsetComponents.second = 1
                
                var subEventStartDate = (Calendar.current as NSCalendar).date(byAdding: offsetComponents, to:subEventEndDate! , options: NSCalendar.Options(rawValue: 0))
                let subEventStartDateComponentsWithoutTime = (Calendar.current as NSCalendar).components(unitFlags, from: subEventStartDate!)
                let subEventStartDateWithoutTime = Calendar.current.date(from: subEventStartDateComponentsWithoutTime)
                while(subEventStartDateWithoutTime?.compare(endDateWithoutTime!) == ComparisonResult.orderedAscending)
                {
                    //    var start
                    subEvent.startDate = subEventStartDate!
                    offsetComponents.second = 59
                    offsetComponents.hour = 23
                    offsetComponents.minute = 59
                    
                    subEventEndDate = (Calendar.current as NSCalendar).date(byAdding: offsetComponents, to:subEventEndDate! , options: NSCalendar.Options(rawValue: 0))
                    subEvent.endDate = subEventEndDate!
                    
                    calEvents.append(subEvent)
                    offsetComponents.second = 1
                    
                    
                    subEventStartDate = (Calendar.current as NSCalendar).date(byAdding: offsetComponents, to:subEventEndDate! , options: NSCalendar.Options(rawValue: 0))
                    let subEventStartDateComponentsWithoutTime = (Calendar.current as NSCalendar).components(unitFlags, from: subEventStartDate!)
                    // 5th June  get date.
                    _ = Calendar.current.date(from: subEventStartDateComponentsWithoutTime)
                    
                }
                
                subEvent.startDate = subEventStartDate!
                subEvent.endDate = event.endDate
                
                
                
            }
            else
            {
                calEvents.append(event)
            }
            
            
        }
        
        for event in calEvents {
            
            print(event.title , event.startDate , event.endDate)
        }
    }
    
    
    
}
