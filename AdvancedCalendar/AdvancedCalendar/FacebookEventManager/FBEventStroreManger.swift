//
//  FBEventStroreManger.swift
//  AdvancedCalendar
//
//  Created by Satendra Dagar on 18/12/17.
//  Copyright © 2017 Satendra Singh. All rights reserved.
//

import Foundation

class FBEventStroreManger: NSObject {
    private var fbEvents = [FBUserEvent]()
    static let sharedStore = FBEventStroreManger()
//    lazy var sharedStore: FBEventStroreManger = {
//        return FBEventStroreManger()
//    }()

    func updateEvent(event: FBUserEvent)  {
    
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
