   //
//  PreferencesStore.swift
//  calendar
//
//  Created by nidhi on 5/8/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa
import ServiceManagement

var defaultTrue = 0
var defaultFalse = 1
var defaultValueNotSet = 0

class PreferencesStore: NSObject {
    
    static let sharedInstance = PreferencesStore()

    var runAtLogin = defaultTrue
    var firstDayOfWeek : String? = "Monday"
    
    
    var higlightDays = [5,6]
    var agendaTimeFormat = 0
    var agendaHeaderFormat = 0
    var topBarFormat = 1

    var headerDay : [String] = []
    var headerDayHighLight : [Bool] = []
    var yearFormat = 0
    var monthFormat = 0
    var weekDayFormat = 0
    var delimiterFormat = 0
    var TimeFormat = 0
    var includeSecond = 0
    var dayFormat = 0
    var disableKey1 = 0
    var disableKey2 = 0
    var disableKey3 = 0
    var disableKey4 = 0
    var disableKey5 = 0
    var disableKey6 = 0
    var disableKey7 = 0
    // state keys.
    var stateKey_FourDigit = 1
    var stateKey_TwoDigit = 0
    var stateKey_ThreeLetter = 1
    var stateKey_Fullname = 0
    var statekey_Number = 0
    var stateKey_3Letter = 1
    var stateKey_WeekFullName = 0
    var stateKey_2Letter = 0
    var stateKey_Space = 1
    var stateKey_Slash = 0
    var stateKey_Dot = 0
    var stateKey_DayMonthYear = 1
    var stateKey_MonthDayYear = 0
    var stateKey_YearMonthDay = 0
    var stateKey_24Hours = 1
    var stateKey_12Hours = 0
    var stateKey_ShowSecond = 0
    
    
    //June 19th.
    let weekDayList = ["Monday" , "Tuesday" , "Wednesday", "Thursday" , "Friday" , "Saturday", "Sunday"]
    
    
    let defaults = UserDefaults.standard

    fileprivate override init() {
        
        super.init()
  //  5th June convert swift 3.0.
        runAtLogin = defaults.integer(forKey: "runAtLogin")
        if runAtLogin == defaultValueNotSet {
            runAtLogin = defaultTrue
            self.saveRunAtLogin()
           
        }
        
        
        firstDayOfWeek = defaults.string(forKey: "firstDayOfWeek")
        if firstDayOfWeek == nil {
            firstDayOfWeek = "Monday"
            // Save value
        }
        
        NSLog("=========== FirstDayOfWeek - %@", firstDayOfWeek!)
        
        if let temp = UserDefaults.standard.object(forKey: "higlightDays") as? [Int] {
            higlightDays = temp//5,6
        }
        else{
            higlightDays = [5,6]
        }
        
        NSLog("=========== highlightDays - %@ ===========", higlightDays)
      
        agendaTimeFormat = defaults.integer(forKey: "agendaTimeFormat")
        if agendaTimeFormat == 0 {
            // Save value
        }
        
        agendaHeaderFormat = defaults.integer(forKey: "agendaHeaderFormat")
        if agendaHeaderFormat == 0 {
            // Save value
        }
//        June27
        topBarFormat = defaults.integer(forKey: "topBarFormat")
        if topBarFormat == 0 {
            topBarFormat = 1
        }
        yearFormat = defaults.integer(forKey: "yearFormat")
        if yearFormat == 0 {
            yearFormat = 1
        }
        monthFormat = defaults.integer(forKey: "monthFormat")
        if monthFormat == 0 {
            monthFormat = 1
        }
        weekDayFormat = defaults.integer(forKey: "weekDayFormat")
        if weekDayFormat == 0 {
            weekDayFormat = 1
        }
        delimiterFormat = defaults.integer(forKey: "delimiterFormat")
        if delimiterFormat == 0 {
            delimiterFormat = 1
        }
        TimeFormat = defaults.integer(forKey: "TimeFormat")
        if TimeFormat == 0 {
            TimeFormat = 1
            
        }
        dayFormat = defaults.integer(forKey: "daySetting")
        if dayFormat == 0 {
            dayFormat = 1
        }
        includeSecond = defaults.integer(forKey: "includeSecond")
        if includeSecond == 0{
            includeSecond = 1
                    
            }
        
        
        disableKey1 = defaults.integer(forKey: "disableKey1")
        disableKey2 = defaults.integer(forKey: "disableKey2")
        disableKey3 = defaults.integer(forKey: "disableKey3")
        disableKey4 = defaults.integer(forKey: "disableKey4")
        disableKey5 = defaults.integer(forKey: "disableKey5")
        disableKey6 = defaults.integer(forKey: "disableKey6")
        disableKey7 = defaults.integer(forKey: "disableKey7")
        // state key :
        stateKey_FourDigit = defaults.integer(forKey: "stateKey_FourDigit")
        stateKey_TwoDigit = defaults.integer(forKey: "stateKey_TwoDigit")
        stateKey_ThreeLetter = defaults.integer(forKey: "stateKey_ThreeLetter")
        stateKey_Fullname = defaults.integer(forKey: "stateKey_Fullname")
        statekey_Number = defaults.integer(forKey: "stateKey_Number")
        stateKey_3Letter = defaults.integer(forKey: "stateKey_3Letter")
        stateKey_WeekFullName = defaults.integer(forKey: "stateKey_WeekFullName")
        stateKey_2Letter = defaults.integer(forKey: "stateKey_2Letter")
        stateKey_Space = defaults.integer(forKey: "stateKey_Space")
        stateKey_Slash = defaults.integer(forKey: "stateKey_Slash")
        stateKey_Dot = defaults.integer(forKey: "stateKey_Dot")
        stateKey_DayMonthYear = defaults.integer(forKey: "stateKey_DayMonthYear")
        stateKey_MonthDayYear = defaults.integer(forKey: "stateKey_MonthDayYear")
        stateKey_YearMonthDay = defaults.integer(forKey: "stateKey_YearMonthDay")
        stateKey_24Hours = defaults.integer(forKey: "stateKey_24Hours")
        stateKey_12Hours = defaults.integer(forKey: "stateKey_12Hours")
        stateKey_ShowSecond = defaults.integer(forKey: "stateKey_ShowSecond")
        
        // Initialize header day
        
        let firstDayIndex = weekDayList.index(of: self.firstDayOfWeek!)
        
        for index in 0...6 {
            let dayIndex  = (firstDayIndex! + index ) % 7
            var highlight : Bool ;
            if (higlightDays.index(of: dayIndex) != nil) {
                highlight = true
            }
            else{
                highlight = false
            }
            
            let dayString : NSString = weekDayList [ dayIndex ] as NSString ;
            
            let subDayString = dayString.substring(to: 3).uppercased()
            
            headerDay.append(subDayString)
            headerDayHighLight.append(highlight)
        }
       
    }
    
    
    
    
    func saveRunAtLogin( )
    {
        self.defaults.set(self.runAtLogin, forKey: "runAtLogin")
        
        if(self.runAtLogin == defaultTrue)
        {
            
            if (SMLoginItemSetEnabled("ah.com.LauncherAdvancedCalendar" as CFString, true) == false) {
                let myPopup: NSAlert = NSAlert()
                myPopup.messageText = "An error ocurred"
                myPopup.informativeText = "Couldn't add application to launch at login item list."
                myPopup.alertStyle = NSAlertStyle.informational
                myPopup.addButton(withTitle: "OK")
                myPopup.runModal()
            }
        }
        else{
            
            if (SMLoginItemSetEnabled("ah.com.LauncherAdvancedCalendar" as CFString, false) == false) {
                let myPopup: NSAlert = NSAlert()
                myPopup.messageText = "An error ocurred"
                myPopup.informativeText = "Couldn't remove application from launch at login item list."
                myPopup.alertStyle = NSAlertStyle.informational
                myPopup.addButton(withTitle: "OK")
                myPopup.runModal()
            }
            
        }
        
    }
    
    func reloadData() -> Void {
        headerDay = []
        headerDayHighLight = []
        runAtLogin = defaults.integer(forKey: "runAtLogin")
        if runAtLogin == defaultValueNotSet {
            runAtLogin = defaultTrue
            self.saveRunAtLogin()
            
        }
        
        
        firstDayOfWeek = defaults.string(forKey: "firstDayOfWeek")
        if firstDayOfWeek == nil {
            firstDayOfWeek = "Monday"
            // Save value
        }
        
        NSLog("=========== FirstDayOfWeek - %@", firstDayOfWeek!)
        
        if let temp = UserDefaults.standard.object(forKey: "higlightDays") as? [Int] {
            higlightDays = temp//5,6
        }
        else{
            higlightDays = [5,6]
        }
        
        NSLog("=========== highlightDays - %@ ===========", higlightDays)
        
        agendaTimeFormat = defaults.integer(forKey: "agendaTimeFormat")
        if agendaTimeFormat == 0 {
            // Save value
        }
        
        agendaHeaderFormat = defaults.integer(forKey: "agendaHeaderFormat")
        if agendaHeaderFormat == 0 {
            // Save value
        }
        
        // Initialize header day
        
        let firstDayIndex = weekDayList.index(of: self.firstDayOfWeek!)
        
        for index in 0...6 {
            let dayIndex  = (firstDayIndex! + index ) % 7
            var highlight : Bool ;
            if (higlightDays.index(of: dayIndex) != nil) {
                highlight = true
            }
            else{
                highlight = false
            }
            
            let dayString : NSString = weekDayList [ dayIndex ] as NSString ;
            
            let subDayString = dayString.substring(to: 3).uppercased()
            
            headerDay.append(subDayString)
            headerDayHighLight.append(highlight)
        }
    }



    func saveFirstDayOfWeek( )
    {
        self.defaults.set(self.firstDayOfWeek, forKey: "firstDayOfWeek")
    }

    func saveAgendaTimeFormat( )
    {
        self.defaults.set(self.agendaTimeFormat, forKey: "agendaTimeFormat")
    }

    func saveAgendaHeaderFormat( )
    {
        self.defaults.set(self.agendaHeaderFormat, forKey: "agendaHeaderFormat")
       
    }
    
    func saveHighlightDays()
    {
        self.defaults.set(self.higlightDays , forKey:"higlightDays" )
    }
    
    func savetopBarFormat()
    {
        self.defaults.set(self.topBarFormat, forKey: "topBarFormat")
//        let appDalegate = NSApplication.shared().delegate as! AppDelegate
//        appDalegate.updateTopbar()
    }
    
    func saveYearFormat()
    {
        self.defaults.set(self.yearFormat, forKey: "yearFormat")
        print(self.yearFormat)
    }
    
    func saveMonthFormat()
    {
        self.defaults.set(self.monthFormat, forKey: "monthFormat")
    }
    func saveWeekDayFormat()
    {
        self.defaults.set(self.weekDayFormat, forKey: "weekDayFormat")
    }
    func saveDelimiterFormat()
    {
        self.defaults.set(self.delimiterFormat, forKey: "delimiterFormat")
    }
    func saveTimeFormat()
    {
        self.defaults.set(self.TimeFormat, forKey: "TimeFormat")
    }
    func saveDayFormat()
    
    {
        self.defaults.set(self.dayFormat, forKey: "dayFormat")
    }
    
    func saveDisableKey1()
    {
        self.defaults.set(self.disableKey1, forKey: "disableKey1")
    }
    func saveDisableKey2()
    {
        self.defaults.set(self.disableKey2, forKey: "disableKey2")
    }
    func saveDisableKey3()
    {
        self.defaults.set(self.disableKey3, forKey: "disableKey3")
    }
    func saveDisableKey4()
    {
        self.defaults.set(self.disableKey4, forKey: "disableKey4")
    }
    func saveDisableKey5()
    {
        self.defaults.set(self.disableKey5, forKey: "disableKey5")
    }
    func saveDisableKey6()
    {
        self.defaults.set(self.disableKey6, forKey: "disableKey6")
    }
    func saveDisableKey7()
    {
        self.defaults.set(self.disableKey7, forKey: "disableKey7")
    }
    func saveIncludSecond()
    {
        self.defaults.set(self.includeSecond, forKey: "includeSecond")
    }
    
    func saveStateKey_FourDigit()
    {
        self.defaults.set(self.stateKey_FourDigit, forKey: "stateKey_FourDigit")
    }
    func saveStateKey_TwoDigit()
    {
        self.defaults.set(self.stateKey_TwoDigit, forKey: "stateKey_TwoDigit")
    }
    func saveStateKey_ThreeLetter()
    {
        self.defaults.set(self.stateKey_ThreeLetter, forKey: "stateKey_ThreeLetter")
    }
    func saveStateKey_FullName()
    {
        self.defaults.set(self.stateKey_Fullname, forKey: "stateKey_Fullname")
        
    }
    func saveStateKey_Number()
    {
        self.defaults.set(self.statekey_Number, forKey: "stateKey_Number")
        
    }
    func saveStateKey_3Letter()
    {
        self.defaults.set(self.stateKey_3Letter, forKey: "stateKey_3Letter")
    }
    func saveStateKey_WeekFullName()
    {
        self.defaults.set(self.stateKey_WeekFullName, forKey: "stateKey_WeekFullName")
    }
    func saveStateKey_2Letter()
    {
        self.defaults.set(self.stateKey_2Letter, forKey: "stateKey_2Letter")
    }
    func saveStateKey_Space()
    {
        self.defaults.set(self.stateKey_Space, forKey: "stateKey_Space")
    }
    func saveStateKey_Slash()
    {
        self.defaults.set(self.stateKey_Slash, forKey: "stateKey_Slash")
    }
    func saveStateKey_Dot()
    {
        self.defaults.set(self.stateKey_Dot, forKey: "stateKey_Dot")
        
    }
    func saveStateKey_DayMonthYear()
    {
        self.defaults.set(self.stateKey_DayMonthYear, forKey: "stateKey_DayMonthYear")
    }
    func saveStateKey_MonthDayYear()
    {
        self.defaults.set(self.stateKey_MonthDayYear, forKey: "stateKey_MonthDayYear")
        
    }
    func saveStateKey_YearMonthDay()
    {
        self.defaults.set(self.stateKey_YearMonthDay, forKey: "stateKey_YearMonthDay")
    }
    func saveStateKey_24Hours()
    {
        self.defaults.set(self.stateKey_24Hours, forKey: "stateKey_24Hours")
    }
    func saveStateKey_12Hours()
    {
        self.defaults.set(self.stateKey_12Hours, forKey: "stateKey_12Hours")
    }
    func saveStateKey_ShowSecond()
    {
        self.defaults.set(self.stateKey_ShowSecond, forKey: "stateKey_ShowSecond")
    }
   
   }
