//
//  GoogleEventStoreMaanger.swift
//  AdvancedCalendar
//
//  Created by Satendra Dagar on 18/04/18.
//  Copyright © 2018 Satendra Singh. All rights reserved.
//

import Foundation
import EventKit

let googleCalendarName = "Google Lilius"
let googleCalendarIdentifier = "com.google.Lilius"

class GoogleEventStoreMaanger: NSObject {
    var timer: Timer?
    private var fbEvents = [FBUserEvent]()
    static let sharedStore = GoogleEventStoreMaanger()
    let googleEventManger = GoogleEventManager.init()
    //    lazy var sharedStore: FBEventStroreManger = {
    //        return FBEventStroreManger()
    //    }()
    
    func setupRefreshEventsTimer(){
        if nil != timer{//avoid any existing timer
            self.tearDownRefreshTimer();
        }
        let authorization = GTMAppAuthFetcherAuthorization(fromKeychainForName: kGTMAppAuthKeychainItemName)
        
        if nil == authorization {
            return;
        }
        self.refreshEvents()
        timer = Timer.scheduledTimer(timeInterval: 3600, target: self, selector: #selector(self.refreshEvents), userInfo: nil, repeats: true)
        
    }
    
    func tearDownRefreshTimer()  {
        timer?.invalidate()
        timer = nil
    }
    
    func refreshEvents()  {
        googleEventManger.refreshEvents()
    }
    
    func saveGoogleEvents(googleEvents:[GTLRCalendar_Event]) -> Void {
        
        let calendar = EKCalendar.calendarWithTitle(calendarName: googleCalendarName)
        
        for event in googleEvents {
            event.syncEventWithCalendar(calendar: calendar)
        }
    }
}


extension GTLRCalendar_Event{
    
    func syncEventWithCalendar(calendar:EKCalendar) -> Void {
        let title = summary
        let details = descriptionProperty
        let eventID = identifier ?? iCalUID
        let start = (originalStartTime?.completeDate()) ?? self.start?.completeDate()
        let endDT = end?.completeDate()
        let link = htmlLink ?? ""
        calendar.syncEventWith(title: title, start: start, end: endDT, details: details, eventID: eventID, rsvp: nil, eventURL: link)
//        EKCalendar.syncFBEventWith(title: title, start: start, end: end, details: details, eventID: eventID, rsvp: rsvp)

    }
}

extension GTLRCalendar_EventDateTime{
    
    func completeDate() -> Date? {
        
        var date = dateTime?.date
        if let tzName = timeZone{
            
            if let tZ = NSTimeZone(name: tzName){
                date = date?.addingTimeInterval(TimeInterval(tZ.secondsFromGMT))
            }
        }
        return date
    }

}
