//
//  PreferenceAccount.swift
//  AdvancedCalendar
//
//  Created by Satendra Dagar on 13/02/18.
//  Copyright © 2018 Satendra Singh. All rights reserved.
//

import Foundation

class PreferenceAccount: NSObject {
    
    var title : String?
    var identifier : String?
    var status = 0
    
    init(withTitle inTitle:String?, inIdentifier:String?, inStatus:Int?) {
        self.title = inTitle
        self.identifier = inIdentifier
        self.status = inStatus ?? 0
    }
    func dictionaryRepresentation() -> [String:Any?] {
        return ["title" : title,"identifier" : identifier,"status" : status]
    }
}
