//
//  FBEventStroreManger.swift
//  AdvancedCalendar
//
//  Created by Satendra Dagar on 18/12/17.
//  Copyright © 2017 Satendra Singh. All rights reserved.
//

import Foundation
import EventKit

let fbCalendarName = "FB Lilius"
let fbCalendarIdentifier = "com.fb.Lilius"

class FBEventStroreManger: NSObject {
    var timer: Timer?
    private var fbEvents = [FBUserEvent]()
    static let sharedStore = FBEventStroreManger()
//    lazy var sharedStore: FBEventStroreManger = {
//        return FBEventStroreManger()
//    }()

    func setupRefreshFacebookEventsTimer(){
        if nil != timer{//avoid any existing timer
            self.tearDownRefreshTimer()
        }
         timer = Timer.scheduledTimer(timeInterval: 1800, target: self, selector: #selector(self.refreshEvents), userInfo: nil, repeats: true)

    }
    
    func tearDownRefreshTimer()  {
        timer?.invalidate()
        timer = nil
    }
    
    func refreshEvents()  {
        FacebookEventManager.requestEventUpdate(sender: nil)
    }
    
    func updateEvent(event: FBUserEvent)  {
        
    }

    func removeFacebookCalendar() {
        self.tearDownRefreshTimer()
        let eventStore = EKEventStore () //default event store
        let type = EKEntityType.event;
        let calendars : NSArray = eventStore.calendars(for: type) as NSArray
        var _calendar : EKCalendar
        
        // 2
        let calendarTitle = fbCalendarName
        let predicate =  NSPredicate(format:"title matches %@", calendarTitle)
        var filtered = calendars.filtered(using: predicate)
        
        if (filtered.count > 0)
        {
            _calendar = filtered[0] as! EKCalendar
            do {
                
                try eventStore.removeCalendar(_calendar, commit: true)
                
            } catch {
                let err = error as NSError
                //                let details = err.localizedDescription
                //                let alert = NSAlert(title: "Event could not save", message: details, preferredStyle: .Alert)
                DispatchQueue.main.async {
                    NSApp.presentError(err)
                    print("\((error as NSError).localizedDescription)")
                }
                
            }
        }
    }
    
    func updateEvents(eventsDict: [[String:Any]])  {
        for dict in eventsDict {
            let uEvent = FBUserEvent.init(event: dict)
            print(uEvent.descirption())
            uEvent.syncEventWithCalendar()
        }
    }

    func allEvents() ->[FBUserEvent] {
    
        return fbEvents;
    }

}


extension EKCalendar{
    /*var title:String?
     var start:Date?
     var end:Date?
     var details:String?
     var eventID:String?
     var rsvp:String?
     */
    static func syncEventWith(title:String?, start:Date?,end:Date?,details:String?,eventID:String?,rsvp:String?) {
        let eventStore = EKEventStore () //default event store
        let type = EKEntityType.event;
        let calendars : NSArray = eventStore.calendars(for: type) as NSArray
        var _calendar : EKCalendar
        
        // 2
        let calendarTitle = fbCalendarName
        let predicate =  NSPredicate(format:"title matches %@", calendarTitle)
        var filtered = calendars.filtered(using: predicate)
        if (filtered.count == 0) {//Create a new calendar
            _calendar = EKCalendar.init(for: .event, eventStore: eventStore)
            _calendar.title = fbCalendarName
            _calendar.attachLocalSourceType()
            do {
                
                try eventStore.saveCalendar(_calendar, commit: true)
                
            } catch {
                let err = error as NSError
                //                let details = err.localizedDescription
                //                let alert = NSAlert(title: "Event could not save", message: details, preferredStyle: .Alert)
                DispatchQueue.main.async {
                    NSApp.presentError(err)
                    print("\((error as NSError).localizedDescription)")
                }
   
            }
            //            _calendar.calendarIdentifier = fbCalendarIdentifier
        }
        else {//(filtered.count > 0)
            _calendar = filtered[0] as! EKCalendar
        }
        print(_calendar.title)
        if let id = eventID {//Get event id
            //                let titlePredicate =  NSPredicate(format:"url.absoluteString matches %@",id)
            if let startDat = start {
                var endDat = Calendar.current.date(byAdding: .year, value: 1, to: startDat)
                
                if let endDt = end {
                    endDat = endDt
                }
                let pre = eventStore.predicateForEvents(withStart: startDat, end: endDat!, calendars: nil)
                let events = eventStore.events(matching: pre)
                
                var existingEvent: EKEvent?
                for evt in events{
                    if ((evt.url?.absoluteString == "https://www.facebook.com/events/\(id)") || (evt.title == title && evt.notes == details)){//Check if matching, we just set the url
                        existingEvent = evt
                        break;
                    }
                    
                }
                if let oldEvent = existingEvent{
                    oldEvent.title = title ?? "";
                    oldEvent.notes = details
                    oldEvent.url = URL.init(string: "https://www.facebook.com/events/\(id)")
                    
                    if let startDat = start {
                        oldEvent.startDate = startDat
                    }
                    if let endDat = end {
                        oldEvent.endDate = endDat
                    }
                }
                else{ //Create a new event in the DB
                    let newEvent = EKEvent.init(eventStore: eventStore)
                    
                    newEvent.title = title ?? "";
                    newEvent.notes = details
                    newEvent.url = URL.init(string: "https://www.facebook.com/events/\(id)")
                    
                    newEvent.calendar = _calendar
                    if let startDat = start {
                        newEvent.startDate = startDat
                        if let endDat = end {
                            newEvent.endDate = endDat
                        }
                        else{
                            let endDat = start?.addingTimeInterval(24.0*60.0*60.0)//Assing it for full day
                            newEvent.endDate = endDat!
                        }
                    }
                    
                    do {
                        
                        try eventStore.save(newEvent, span: .thisEvent, commit: true)
                        
                    } catch {
                        let err = error as NSError
                        DispatchQueue.main.async {
                            NSApp.presentError(err)
                            print("\((error as NSError).localizedDescription)")
                        }
                        
                    }
                    
                }
            }
        }
    }
}

extension EKCalendar{
    
    func attachLocalSourceType()  {
        // Iterate over all sources in the event store and look for the local source
        let eventStore = EKEventStore() //default event store
        
        var theSource:EKSource?;
        for source in eventStore.sources {
            if (source.sourceType == EKSourceType.local) {
                theSource = source;
                break;
            }
        }
        
        if let localSource = theSource {
            self.source = localSource;
        }
    }
}
