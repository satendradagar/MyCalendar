//
//  GoogleEventManager.swift
//  AdvancedCalendar
//
//  Created by Satendra Dagar on 14/04/18.
//  Copyright © 2018 Satendra Singh. All rights reserved.
//

import Foundation

class GoogleEventManager: NSObject {

//    static let sharedInstance = GoogleEventManager()

    var service:GTLRCalendarService?
    
    var calendarList: GTLRCalendar_CalendarList?
    var calendarListTicket: GTLRServiceTicket?
    var calendarListFetchError: Error?
    var currentCalendarIndex = 0
    
    func fetchCalendarList() {
        calendarList = nil
        calendarListFetchError = nil
        let service: GTLRCalendarService? = calendarService()
        let query = GTLRCalendarQuery_CalendarListList.query()
    //    let shouldFetchedOwned: Bool = calendarSegmentedControl.selectedSegment == 1
        let shouldFetchedOwned: Bool = true
        if shouldFetchedOwned {
            query.minAccessRole = kGTLRCalendarMinAccessRoleOwner
        }
        calendarListTicket = service?.executeQuery(query, completionHandler: {(_ callbackTicket: GTLRServiceTicket?, _ calendarList: Any?, _ callbackError: Error?) -> Void in
            // Callback
            self.calendarList = calendarList as? GTLRCalendar_CalendarList
            self.calendarListFetchError = callbackError
            self.calendarListTicket = nil
            print("List:\(self.calendarList?.items)")
            self.refreshAllCalendarListEvents()
            //    [self updateUI];
        })
        //    [self updateUI];
    }
    
    func refreshEvents() -> Void {

        let authorization = GTMAppAuthFetcherAuthorization(fromKeychainForName: kGTMAppAuthKeychainItemName)

        if nil == authorization {
            return;
        }
    
        self.fetchCalendarList()
//        self.refreshAllCalendarListEvents()
        
    }
    
    
    func refreshAllCalendarListEvents() -> Void {
        
//        for calendar in self.calendarList?.items {
//
//        }
        currentCalendarIndex = 0
        self.checkAndLoadNextCalendarEvents()
    }
  
    func checkAndLoadNextCalendarEvents() -> Void {
        
        if let calItems = self.calendarList?.items {
            
            if calItems.count > currentCalendarIndex{//We have some valid object to iterate
                self.fetchEventsForCalendar(calendarEntry: calItems[currentCalendarIndex], completion: {
                    self.currentCalendarIndex = self.currentCalendarIndex + 1 //Move to next object
                   self.checkAndLoadNextCalendarEvents()
                });
            }
        }
        
    }
    
    func fetchEventsForCalendar(calendarEntry:GTLRCalendar_CalendarListEntry?, completion:@escaping (()->Void)) {
        var calEvents: GTLRCalendar_Events?
        var eventsTicket: GTLRServiceTicket?
        var eventsFetchError: Error?
//        var acls: GTLRCalendar_Acl?
//        var aclsFetchError: Error?
//
//        settings = nil
//        settingsFetchError = nil
        
        let service: GTLRCalendarService? = calendarService()
        let selectedCalendar = calendarEntry
        if selectedCalendar != nil {
            let calendarID = selectedCalendar?.identifier
                // We will fetch the events for this calendar, the ACLs for this calendar,
                // and the user's settings, together in a single batch.
            let batch = GTLRBatchQuery()
            let eventsQuery = GTLRCalendarQuery_EventsList.query(withCalendarId: calendarID!)
//            eventsQuery.completionBlock = {(_ callbackTicket: GTLRServiceTicket?, _ events: GTLRCalendar_Events?, _ callbackError: Error?) -> Void in
//                events = events
//                eventsFetchError = callbackError
//            }
            eventsQuery.completionBlock = {(_ callbackTicket: GTLRServiceTicket?, _ events: Any?, _ callbackError: Error?) in
                
                    calEvents = events as? GTLRCalendar_Events
                    eventsFetchError = callbackError
                if let itms = calEvents?.items{
                GoogleEventStoreMaanger.sharedStore.saveGoogleEvents(googleEvents: itms)

                    for evnt in itms {
                        print(evnt.summary)
                    }
                }
                print(eventsFetchError.debugDescription)
                    completion()
            }
//            }
//            (GTLRServiceTicket *callbackTicket,
//             id _Nullable object,
//                NSError * _Nullable callbackError)

            batch.addQuery(eventsQuery)

        //            let aclQuery = GTLRCalendarQuery_AclList.query(withCalendarId: calendarID)
//            aclQuery.completionBlock = {(_ callbackTicket: GTLRServiceTicket?, _ acls: GTLRCalendar_Acl?, _ callbackError: Error?) -> Void in
//                self.acls = acls
//                self.aclsFetchError = callbackError
//            }
//            batch.add(aclQuery)
//            let settingsQuery = GTLRCalendarQuery_SettingsList.query()
//            settingsQuery.completionBlock = {(_ callbackTicket: GTLRServiceTicket?, _ settings: GTLRCalendar_Settings?, _ callbackError: Error?) -> Void in
//                self.settings = settings
//                self.settingsFetchError = callbackError
//            }
//            batch.add(settingsQuery)
            eventsTicket = service?.executeQuery(batch, completionHandler: { (_ callbackTicket: GTLRServiceTicket?, _ batchResult: Any?, _ callbackError: Error?) in
                //                // Callback
                //                //
                //                // For batch queries with successful execution,
                //                // the result is a GTLRBatchResult object
                //                //
                //                // At this point, the query completion blocks
                //                // have already been called
                eventsTicket = nil

            })
//            eventsTicket = service?.execute(batch, completionHandler: {(_ callbackTicket: GTLRServiceTicket?, _ batchResult: GTLRBatchResult?, _ callbackError: Error?) -> Void in
//                // Callback
//                //
//                // For batch queries with successful execution,
//                // the result is a GTLRBatchResult object
//                //
//                // At this point, the query completion blocks
//                // have already been called
//                self.eventsTicket = nil
//                self.updateUI()
//            })
//            updateUI()
        }
    }

    func calendarService() -> GTLRCalendarService? {
        if service == nil {
            service = GTLRCalendarService.init()
            // Have the service object set tickets to fetch consecutive pages
            // of the feed so we do not need to manually fetch them
            service?.shouldFetchNextPages = true
            // Have the service object set tickets to retry temporary error conditions
            // automatically
            service?.isRetryEnabled = true
            let authorization = GTMAppAuthFetcherAuthorization(fromKeychainForName: kGTMAppAuthKeychainItemName)
            service?.authorizer = authorization;

        }
        return service
    }
}
