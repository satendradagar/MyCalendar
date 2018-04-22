//
//  PreferencesWindowController.swift
//  calendar
//
//  Created by nidhi on 5/5/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa
import Facebook_Mac_Core
//import

class PreferencesWindowController: NSWindowController {
    
    var prefStore = PreferencesStore.sharedInstance
    var facebookLoginWindow: FacebookLoginWindowController?
    var googleLoginManager = GoogleLoginManager.sharedInstance
    
    @IBOutlet weak var outletRunAtLogin: NSButton!
    @IBOutlet weak var outletFirstDayOfWeek: NSComboBox!
    @IBOutlet weak var outletHighlightDays: NSSegmentedControl!
    
    @IBOutlet weak var outletAgendaTimeFormat: NSComboBox!
    @IBOutlet weak var outletAgendaHeaderFormat: NSComboBox!
    
    @IBOutlet weak var lastColumnBox: NSBox!
    @IBOutlet weak var splitView: NSSplitView!

    @IBOutlet var dateView: NSView!
    @IBOutlet var timeView: NSView!
    @IBOutlet weak var dateNTimeBrowserOutlet: NSBrowser!
    
   
    @IBOutlet var yearSettingView: NSView!
    
    @IBOutlet var enableCheckBtn: NSButton!
    @IBOutlet var btn_Fourdigits: NSButton!
    @IBOutlet var btn_twodigits: NSButton!
    @IBOutlet var monthSettingView: NSView!
    @IBOutlet var enableCheck_month: NSButton!
    @IBOutlet var btn_ThreeLetter: NSButton!
    @IBOutlet var btn_FullName: NSButton!
    @IBOutlet var btn_number: NSButton!
    @IBOutlet var DaySettingView: NSView!
    @IBOutlet var enableCheck_day: NSButton!
    @IBOutlet var btn_number1: NSButton!
    @IBOutlet var WeekDaySettingView: NSView!
    @IBOutlet var enableCheck_weekDay: NSButton!
    @IBOutlet var btn_3letter: NSButton!
    @IBOutlet var btn_WeekFullName: NSButton!
    @IBOutlet var btn_2letter: NSButton!
    @IBOutlet var delimiterSettingView: NSView!
    @IBOutlet var enableCheck_delimiter: NSButton!
    @IBOutlet var btn_Space: NSButton!
    @IBOutlet var btn_Slash: NSButton!
    @IBOutlet var btn_Dot: NSButton!
    @IBOutlet var orderSettingView: NSView!
    @IBOutlet var enable_OrderSetting: NSButton!
    @IBOutlet var btn_dayMonthYear: NSButton!
    @IBOutlet var btn_MonthDayYear: NSButton!
    @IBOutlet var btn_YearMonthDay: NSButton!
    @IBOutlet var timeSettingView: NSView!
    @IBOutlet var btn_enableTimeSetting: NSButton!
    @IBOutlet var btn_24Hours: NSButton!
    @IBOutlet var btn_12Hours: NSButton!
    @IBOutlet var btn_ShowSecond: NSButton!
    @IBOutlet var btn_FBlogin: NSButton!

 //   @IBOutlet weak var dateSettingBrowserOutlet: NSView!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        setIntialDefaultValues()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.yearSettingView.isHidden = true
        self.monthSettingView.isHidden = true
        self.DaySettingView.isHidden = true
        self.WeekDaySettingView.isHidden = true
        self.delimiterSettingView.isHidden = true
        self.orderSettingView.isHidden = true
        self.timeSettingView.isHidden = true
        
        if( prefStore.runAtLogin == defaultTrue) {
            outletRunAtLogin.state = NSOnState
        }
        else
        {
            outletRunAtLogin.state = NSOffState
        }
        
        outletFirstDayOfWeek.stringValue = prefStore.firstDayOfWeek!

        outletAgendaTimeFormat.selectItem(at: prefStore.agendaTimeFormat)
        outletAgendaTimeFormat.stringValue =  outletAgendaTimeFormat.objectValueOfSelectedItem as! String
        
        outletAgendaHeaderFormat.selectItem(at: prefStore.agendaHeaderFormat)
        outletAgendaHeaderFormat.stringValue =  outletAgendaHeaderFormat.objectValueOfSelectedItem as! String
        
        
        for day in 0...outletHighlightDays.segmentCount-1{

//            outletHighlightDays.selectSegment(withTag: prefStore.higlightDays[day])
            
            if(prefStore.higlightDays.index(of: day) == nil )
            {
                outletHighlightDays.setSelected(false, forSegment: day)
            }
            else{
                outletHighlightDays.setSelected(true, forSegment: day)
            }
        }
        
        // enableSetting part
        
        self.enableCheckBtn.state = UserDefaults.standard.integer(forKey: "disableKey2")
        if self.enableCheckBtn.state == NSOffState
        {
        self.btn_Fourdigits.isEnabled = false
        self.btn_twodigits.isEnabled = false
            }
        else if self.enableCheckBtn.state == NSOnState {
        self.enableCheckBtn.state = NSOnState
        self.btn_Fourdigits.isEnabled = true
        self.btn_twodigits.isEnabled = true
        }
        self.enableCheck_month.state = UserDefaults.standard.integer(forKey: "disableKey3")
        if self.enableCheck_month.state == NSOffState {
            
            self.btn_ThreeLetter.isEnabled = false
            self.btn_FullName.isEnabled = false
            self.btn_number.isEnabled = false
        }
        else if enableCheck_month.state == NSOnState{
        
        
        self.enableCheck_month.state = NSOnState
        self.btn_ThreeLetter.isEnabled = true
        self.btn_FullName.isEnabled = true
        self.btn_number.isEnabled = true
        }
        self.enableCheck_day.state = UserDefaults.standard.integer(forKey: "disableKey4")
        
        if self.enableCheck_day.state == NSOffState
        {
            self.btn_number1.isEnabled = false
        }
        else if self.enableCheck_day.state == NSOnState{
        self.btn_number1.isEnabled = true
        }
        
        self.enableCheck_weekDay.state = UserDefaults.standard.integer(forKey: "disableKey5")
        if self.enableCheck_weekDay.state == NSOffState
        {
        self.btn_3letter.isEnabled = false
        self.btn_WeekFullName.isEnabled = false
        self.btn_2letter.isEnabled = false
        }
        else if self.enableCheck_weekDay.state == NSOnState{
        self.enableCheck_weekDay.state = NSOnState
        self.btn_3letter.isEnabled = true
        self.btn_WeekFullName.isEnabled = true
        self.btn_2letter.isEnabled = true
        }
        
        
        
        //view setting part.
        self.btn_Fourdigits.state = UserDefaults.standard.integer(forKey: "stateKey_FourDigit")
        self.btn_twodigits.state = UserDefaults.standard.integer(forKey: "stateKey_TwoDigit")
        self.btn_ThreeLetter.state = UserDefaults.standard.integer(forKey: "stateKey_ThreeLetter")
        self.btn_FullName.state = UserDefaults.standard.integer(forKey: "stateKey_Fullname")
        self.btn_number.state = UserDefaults.standard.integer(forKey: "stateKey_Number")
        self.btn_3letter.state = UserDefaults.standard.integer(forKey: "stateKey_3Letter")
        self.btn_WeekFullName.state = UserDefaults.standard.integer(forKey: "stateKey_WeekFullName")
        self.btn_2letter.state = UserDefaults.standard.integer(forKey: "stateKey_2Letter")
        self.btn_Space.state = UserDefaults.standard.integer(forKey: "stateKey_Space")
        self.btn_Slash.state = UserDefaults.standard.integer(forKey: "stateKey_Slash")
        self.btn_Dot.state = UserDefaults.standard.integer(forKey: "stateKey_Dot")
        self.btn_dayMonthYear.state = UserDefaults.standard.integer(forKey: "stateKey_DayMonthYear")
        self.btn_MonthDayYear.state = UserDefaults.standard.integer(forKey: "stateKey_MonthDayYear")
        self.btn_YearMonthDay.state = UserDefaults.standard.integer(forKey: "stateKey_YearMonthDay")
        
        
        
       
        self.btn_ShowSecond.state = UserDefaults.standard.integer(forKey: "stateKey_ShowSecond")
        
        
//        if self.btn_Fourdigits.state == NSOnState
//        {
//            self.btn_Fourdigits.state = NSOnState
//        }
//        if self.btn_twodigits.state == NSOnState
//        {
//           self.btn_twodigits.state = NSOnState
//        }
//        if self.btn_ThreeLetter.state == NSOnState
//        {
//            self.btn_ThreeLetter.state = NSOnState
//        }
//        if self.btn_FullName.state == NSOnState
//        {
//            self.btn_FullName.state = NSOnState
//        }
//        if self.btn_number.state == NSOnState
//        {
//            self.btn_number.state = NSOnState
//        }
//        if self.btn_3letter.state == NSOnState
//        {
//            self.btn_3letter.state = NSOnState
//        }
//        if self.btn_WeekFullName.state == NSOnState
//        {
//            self.btn_WeekFullName.state = NSOnState
//        }
//        if self.btn_2letter.state == NSOnState
//        {
//            self.btn_2letter.state = NSOnState
//        }
//        
//        if self.btn_Space.state == NSOnState
//        {
//            self.btn_Space.state = NSOnState
//        }
//        if self.btn_Slash.state == NSOnState
//        {
//            self.btn_Slash.state = NSOnState
//        }
//        if self.btn_Dot.state == NSOnState
//        {
//            self.btn_Dot.state = NSOnState
//        }
//        if self.btn_dayMonthYear.state == NSOnState
//        {
//            self.btn_dayMonthYear.state = NSOnState
//        }
//        if self.btn_MonthDayYear.state == NSOnState
//        {
//            self.btn_MonthDayYear.state = NSOnState
//        }
//        if self.btn_YearMonthDay.state == NSOnState
//        {
//            self.btn_YearMonthDay.state = NSOnState
//            
//        }
        self.btn_24Hours.state = UserDefaults.standard.integer(forKey: "stateKey_24Hours")
//        print(btn_24Hours.state)
//        if self.btn_24Hours.state == 1{
//            print(self.btn_24Hours.state)
//            self.btn_24Hours.state = NSOnState
//            self.btn_12Hours.state = NSOffState
//            
//        }
//        else if self.btn_24Hours.state == NSOffState
//        {
//            self.btn_24Hours.state = NSOffState
//            print(self.btn_24Hours.state)
//        }
        self.btn_12Hours.state = UserDefaults.standard.integer(forKey: "stateKey_12Hours")
//        print(self.btn_12Hours.state)
//        if self.btn_12Hours.state == 1
//        {
//            self.btn_12Hours.state = NSOnState
//            self.btn_24Hours.state = NSOffState
//            print(self.btn_12Hours.state)
//        }
//        else if self.btn_12Hours.state == NSOffState{
//            self.btn_12Hours.state = NSOffState
//        }
//        if self.btn_ShowSecond.state == NSOnState
//        {
//            self.btn_ShowSecond.state = NSOnState
//        }
//        else if self.btn_ShowSecond.state == NSOffState{
//            self.btn_ShowSecond.state = NSOffState
//        }
        
        
//        if self.btn_Fourdigits.state == NSOnState {
//            self.btn_Fourdigits.s
//        }
        
        
    }
    
    func setIntialDefaultValues() {
        let isDefaultSet = "Deafult_IS_SET"
        let defaults = UserDefaults.standard
        let isIntialised = defaults.integer(forKey: isDefaultSet)
        if isIntialised != 1 {
            defaults.set(1, forKey: isDefaultSet)
            
            defaults.set(1, forKey: "stateKey_24Hours")
            defaults.set(1, forKey: "stateKey_FourDigit")
            defaults.set(1, forKey: "stateKey_ThreeLetter")
            
            defaults.set(1, forKey: "stateKey_MonthDayYear")
            defaults.set(1, forKey: "stateKey_3Letter")
            defaults.set(1, forKey: "stateKey_Space")
           defaults.synchronize()
        }
        self.updateFBLoginButton()
    }

    func updateFBLoginButton()  {
        let defaults = UserDefaults.standard
        let isFBLogin = defaults.bool(forKey:"fbLogin")
        if  isFBLogin == true {
            btn_FBlogin.title = "Logout"
        }
        else{
            btn_FBlogin.title = "Login"
        }
    }

    var key :NSString = ""


    @IBAction func dateNTimeBorwserClicked(_ sender: AnyObject) {
      print (sender);
        self.yearSettingView.isHidden = true
        self.monthSettingView.isHidden = true
        self.DaySettingView.isHidden = true
        self.WeekDaySettingView.isHidden = true
        self.delimiterSettingView.isHidden = true
        self.orderSettingView.isHidden = true
        self.timeSettingView.isHidden = true
        
        key = dateNTimeBrowserOutlet.path() as NSString
                print(key)
        switch key {
        case "/Date/Order":
            self.orderSettingView.isHidden = false
//            dateNTimeBrowserOutlet.setWidth(0, ofColumn: 3)
//            dateNTimeBrowserOutlet.set
//            dateNTimeBrowserOutlet.
            break
        case "/Date/Format/Year":
            self.yearSettingView.isHidden = false
            break
        case "/Date/Format/Month":
            self.monthSettingView.isHidden = false
            break
        case "/Date/Format/Day" :
            self.DaySettingView.isHidden = false
            break
        case "/Date/Format/Weekday" :
            self.WeekDaySettingView.isHidden = false
            break
        case "/Date/Format/Delimiter" :
            self.delimiterSettingView.isHidden = false
            break
        case "/Time" :
            self.timeSettingView.isHidden = false
            break
        default:
            break
        }

        
        dateNTimeBrowserOutlet.sizeToFit();
        
//        if(dateNTimeBrowserOutlet.path().contains("/Date/Georgian/Order"))
//        {
//            self.orderSettingView.isHidden = false
//        }
//        else if(dateNTimeBrowserOutlet.path().contains("Date/Georgian/Format/Year"))
//        {
//            self.yearSettingView.isHidden = false
//            self.orderSettingView.isHidden = true
//        }
        
        //Mintainence is cool
        
//        if(dateNTimeBrowserOutlet.path().contains("/Date/Georgian/Order/Day Month Year"))
//        {
//            prefStore.topBarFormat = 1;
//        }
//            
//        else if(dateNTimeBrowserOutlet.path().contains("/Date/Georgian/Order/Month Day Year"))
//        {
//            prefStore.topBarFormat = 2;
//            
//           
//        }
//        else if(dateNTimeBrowserOutlet.path().contains("/Date/Georgian/Order/Year Month Day"))
//        {
//            prefStore.topBarFormat = 3;
//        }
//        
//        prefStore.savetopBarFormat()
        
        
        //var col  = dateNTimeBrowserOutlet.co
        
        
    }
    
    @IBAction func runAtLoginValueChanged(_ sender: AnyObject) {
        let button = sender as! NSButton
        if( button.state == NSOnState) {
            prefStore.runAtLogin = defaultTrue
        }
        else
        {
            prefStore.runAtLogin = defaultFalse
        }
        
        prefStore.saveRunAtLogin()
        
    }
    
    @IBAction func firstDayOfWeekChanged(_ sender: AnyObject) {
        DispatchQueue.main.async {
            if let button = sender as? NSComboBox, button.indexOfSelectedItem != -1 {
                self.prefStore.firstDayOfWeek = button.itemObjectValue(at: button.indexOfSelectedItem) as? String
                self.prefStore.saveFirstDayOfWeek()
                self.prefStore.reloadData();
                
                /// June 22th. Notification post
                
                let notificationName = Notification.Name("ReloadCalendarNo");
                NotificationCenter.default.post(name: notificationName, object: nil, userInfo: nil);
            }
        }
        
        
    }
    
    @IBAction func highlightDaysChanged(_ sender: AnyObject) {
        
        let button = sender as! NSSegmentedControl
        var highlightDays : [Int] = []
        
        for buttonSegmentIndex in 0...button.segmentCount-1 {
            
            if(button.isSelected(forSegment: buttonSegmentIndex  ) == true ) {
                highlightDays.append(buttonSegmentIndex)
            }
            
        }
        
        prefStore.higlightDays = highlightDays
        prefStore.saveHighlightDays()
        
        prefStore.reloadData();
        
//        ReloadCalendar
        
        // June 21th Notification post
        let notificationName = Notification.Name("ReloadCalendarNo");
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: nil);
        
    }
    
    @IBAction func agendaTimeFormatChanged(_ sender: AnyObject) {
        DispatchQueue.main.async {
            let button = sender as! NSComboBox
            self.prefStore.agendaTimeFormat = button.indexOfSelectedItem
            self.prefStore.saveAgendaTimeFormat()
        }
    }
    
    @IBAction func agendaHeaderFormatChanged(_ sender: AnyObject) {
        let button = sender as! NSComboBox
        prefStore.agendaHeaderFormat = button.indexOfSelectedItem
        prefStore.saveAgendaHeaderFormat()
    }
    


   

    
    @IBAction func mainClicked(_ sender: NSButton){
        
//        self.btn_dayMonthYear.state = NSOnState
//        self.btn_MonthDayYear.state = NSOffState
//        self.btn_YearMonthDay.state = NSOffState
//        self.btn_Fourdigits.state = NSOnState
//        self.btn_twodigits.state = NSOffState
//        self.btn_ThreeLetter.state = NSOnState
//        self.btn_FullName.state = NSOffState
//        self.btn_number.state = NSOffState
//        self.btn_3letter.state = NSOnState
//        self.btn_WeekFullName.state = NSOffState
//        self.btn_2letter.state = NSOffState
//        self.btn_Space.state = NSOnState
//        self.btn_Slash.state = NSOffState
//        self.btn_Dot.state = NSOffState
        
        switch (sender.tag)
        {
            
        case 1:
            self.btn_dayMonthYear.state = NSOnState
            prefStore.topBarFormat = 1
            prefStore.stateKey_DayMonthYear = self.btn_dayMonthYear.state
            prefStore.stateKey_MonthDayYear = self.btn_MonthDayYear.state
            prefStore.stateKey_YearMonthDay = self.btn_YearMonthDay.state
        case 2:
            self.btn_MonthDayYear.state = NSOnState
            prefStore.topBarFormat = 2
            prefStore.stateKey_MonthDayYear = self.btn_MonthDayYear.state
            
        case 3:
            self.btn_YearMonthDay.state = NSOnState
            prefStore.topBarFormat = 3
            prefStore.stateKey_YearMonthDay = self.btn_YearMonthDay.state
            
        case 4:
            self.btn_Fourdigits.state = NSOnState
            prefStore.yearFormat = 1
            prefStore.saveYearFormat()
            prefStore.stateKey_FourDigit = self.btn_Fourdigits.state
            prefStore.stateKey_TwoDigit = self.btn_twodigits.state
        case 5:
            self.btn_twodigits.state = NSOnState
            prefStore.yearFormat = 2
            prefStore.saveYearFormat()
            prefStore.stateKey_FourDigit = self.btn_Fourdigits.state
            prefStore.stateKey_TwoDigit = self.btn_twodigits.state
            
        case 6:
            self.btn_ThreeLetter.state = NSOnState
            prefStore.monthFormat = 1
            prefStore.stateKey_ThreeLetter = self.btn_ThreeLetter.state
            prefStore.stateKey_Fullname = self.btn_FullName.state
            prefStore.statekey_Number = self.btn_number.state
            
        case 7:
            self.btn_FullName.state = NSOnState
            prefStore.monthFormat = 2
            prefStore.stateKey_ThreeLetter = self.btn_ThreeLetter.state
            prefStore.stateKey_Fullname = self.btn_FullName.state
            prefStore.statekey_Number = self.btn_number.state
            
        case 8:
            self.btn_number.state = NSOnState
            prefStore.monthFormat = 3
            prefStore.stateKey_ThreeLetter = self.btn_ThreeLetter.state
            prefStore.stateKey_Fullname = self.btn_FullName.state
            prefStore.statekey_Number = self.btn_number.state
        case 9:
            self.btn_3letter.state = NSOnState
            prefStore.weekDayFormat = 1
            prefStore.stateKey_2Letter = self.btn_2letter.state
            prefStore.stateKey_WeekFullName = self.btn_WeekFullName.state
            prefStore.stateKey_3Letter = self.btn_3letter.state
        case 10:
            self.btn_WeekFullName.state = NSOnState
            prefStore.weekDayFormat = 2
            prefStore.stateKey_2Letter = self.btn_2letter.state
            prefStore.stateKey_WeekFullName = self.btn_WeekFullName.state
            prefStore.stateKey_3Letter = self.btn_3letter.state
            
        case 11:
            self.btn_2letter.state = NSOnState
            prefStore.weekDayFormat = 3
            prefStore.stateKey_2Letter = self.btn_2letter.state
            prefStore.stateKey_WeekFullName = self.btn_WeekFullName.state
            prefStore.stateKey_3Letter = self.btn_3letter.state
            
        case 12:
            self.btn_Space.state = NSOnState
            prefStore.delimiterFormat = 1
            prefStore.stateKey_Space = self.btn_Space.state
            prefStore.stateKey_Dot = self.btn_Dot.state
            prefStore.stateKey_Slash = self.btn_Slash.state
            
        case 13:
            self.btn_Slash.state = NSOnState
            prefStore.delimiterFormat = 2
            prefStore.stateKey_Slash = self.btn_Slash.state
            prefStore.stateKey_Dot = self.btn_Dot.state
            prefStore.stateKey_Space = self.btn_Space.state
            
        case 14:
            self.btn_Dot.state = NSOnState
            prefStore.delimiterFormat = 3
            prefStore.stateKey_Dot = self.btn_Dot.state
            prefStore.stateKey_Slash = self.btn_Slash.state
            prefStore.stateKey_Space = self.btn_Space.state
        case 15:
            self.btn_24Hours.state = NSOnState
            prefStore.TimeFormat = 1
            prefStore.stateKey_24Hours = self.btn_24Hours.state
            prefStore.stateKey_12Hours = self.btn_12Hours.state
            prefStore.stateKey_ShowSecond = self.btn_ShowSecond.state
            
            print(self.btn_24Hours.state)
        case 16:
            self.btn_12Hours.state = NSOnState
            prefStore.TimeFormat = 2
            prefStore.stateKey_12Hours = self.btn_12Hours.state
            prefStore.stateKey_24Hours = self.btn_24Hours.state
            prefStore.stateKey_ShowSecond = self.btn_ShowSecond.state
        case 17:
            switch (self.btn_ShowSecond.state) {
            case NSOffState:
                self.btn_ShowSecond.state = NSOffState
                prefStore.includeSecond = 1
            case NSOnState:
                self.btn_ShowSecond.state = NSOnState
                prefStore.includeSecond = 2
            default:
                break;
            }
            prefStore.stateKey_24Hours = self.btn_24Hours.state
            prefStore.stateKey_12Hours = self.btn_12Hours.state
            prefStore.stateKey_ShowSecond = self.btn_ShowSecond.state
            
        case 18:
            
            switch (self.btn_enableTimeSetting.state) {
            case NSOffState:
                self.btn_enableTimeSetting.state = NSOffState
                self.btn_24Hours.isEnabled = false
                self.btn_12Hours.isEnabled = false
                self.btn_ShowSecond.isEnabled = false
                break;
            case NSOnState:
                self.btn_enableTimeSetting.state = NSOnState
                self.btn_24Hours.isEnabled = true
                self.btn_12Hours.isEnabled = true
                self.btn_ShowSecond.isEnabled = true
                break;
            default:
                break;
            }
            
            prefStore.disableKey1 = self.btn_enableTimeSetting.state
            
        case 19:
            switch (self.enableCheckBtn.state) {
            case NSOffState:
                self.enableCheckBtn.state = NSOffState
                self.btn_Fourdigits.isEnabled = false
                self.btn_twodigits.isEnabled = false
                break;
            case NSOnState:
                self.enableCheckBtn.state = NSOnState
                self.btn_Fourdigits.isEnabled = true
                self.btn_twodigits.isEnabled = true
                break
            default:
                break;
            }
            
            prefStore.disableKey2 = self.enableCheckBtn.state
        case 20:
            switch (self.enableCheck_month.state) {
            case NSOffState:
                self.enableCheck_month.state = NSOffState
                self.btn_ThreeLetter.isEnabled = false
                self.btn_FullName.isEnabled = false
                self.btn_number.isEnabled = false
                
            case NSOnState:
                self.enableCheck_month.state = NSOnState
                self.btn_ThreeLetter.isEnabled = true
                self.btn_FullName.isEnabled = true
                self.btn_number.isEnabled = true
            default:
                break;
            }
            prefStore.disableKey3 = self.enableCheck_month.state
        case 21:
            switch (self.enableCheck_day.state) {
            case NSOffState:
                self.enableCheck_day.state = NSOffState
                self.btn_number1.isEnabled = false
            case NSOnState:
                self.enableCheck_day.state = NSOnState
                self.btn_number1.isEnabled = true
            default:
                break;
            }
            prefStore.disableKey4 = self.enableCheck_day.state
        case 22:
            switch (self.enableCheck_weekDay.state) {
            case NSOffState:
                self.enableCheck_weekDay.state = NSOffState
                self.btn_3letter.isEnabled = false
                self.btn_WeekFullName.isEnabled = false
                self.btn_2letter.isEnabled = false
            case NSOnState:
                self.enableCheck_weekDay.state = NSOnState
                self.btn_3letter.isEnabled = true
                self.btn_WeekFullName.isEnabled = true
                self.btn_2letter.isEnabled = true
                
            default:
                break
                
            }
            prefStore.disableKey5 = self.enableCheck_weekDay.state
        case 23:
            switch (self.enableCheck_delimiter.state) {
            case NSOffState:
                self.enableCheck_delimiter.state = NSOffState
                self.btn_Space.isEnabled = false
                self.btn_Slash.isEnabled = false
                self.btn_Dot.isEnabled = false
            case NSOnState:
                self.enableCheck_delimiter.state = NSOnState
                self.btn_Space.isEnabled = true
                self.btn_Slash.isEnabled = true
                self.btn_Dot.isEnabled = true
                
            default:
                break
            }
            prefStore.disableKey6 = self.enableCheck_delimiter.state
        case 24:
            switch (self.enable_OrderSetting.state) {
            case NSOffState:
                self.enable_OrderSetting.state = NSOffState
                self.btn_dayMonthYear.isEnabled = false
                self.btn_MonthDayYear.isEnabled = false
                self.btn_YearMonthDay.isEnabled = false
            case NSOnState:
                self.enable_OrderSetting.state = NSOnState
                self.btn_dayMonthYear.isEnabled = true
                self.btn_MonthDayYear.isEnabled = true
                self.btn_YearMonthDay.isEnabled = true
            default:
                break
            }
            prefStore.disableKey7 = self.enable_OrderSetting.state
            
        default:
            break
     
        }
        prefStore.savetopBarFormat()
        prefStore.saveYearFormat()
        prefStore.saveMonthFormat()
        prefStore.saveWeekDayFormat()
        prefStore.saveDelimiterFormat()
        prefStore.saveTimeFormat()
        prefStore.saveDayFormat()
        prefStore.saveDisableKey1()
        prefStore.saveDisableKey2()
        prefStore.saveDisableKey3()
        prefStore.saveDisableKey4()
        prefStore.saveDisableKey5()
        prefStore.saveDisableKey6()
        prefStore.saveDisableKey7()
        prefStore.saveIncludSecond()
        
        prefStore.saveStateKey_FourDigit()
        prefStore.saveStateKey_TwoDigit()
        prefStore.saveStateKey_ThreeLetter()
        prefStore.saveStateKey_FullName()
        prefStore.saveStateKey_Number()
        prefStore.saveStateKey_3Letter()
        prefStore.saveStateKey_WeekFullName()
        prefStore.saveStateKey_2Letter()
        prefStore.saveStateKey_Space()
        prefStore.saveStateKey_Slash()
        prefStore.saveStateKey_Dot()
        prefStore.saveStateKey_DayMonthYear()
        prefStore.saveStateKey_MonthDayYear()
        prefStore.saveStateKey_YearMonthDay()
        prefStore.saveStateKey_24Hours()
        prefStore.saveStateKey_12Hours()
        prefStore.saveStateKey_ShowSecond()
    }
   
    @IBAction func didClickFacebookLogin(_ sender: NSButton) {
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "fbLogin") {
            defaults.set(false, forKey: "fbLogin")
            defaults.set("", forKey: "FB_Profile_Name")
            self.updateFBLoginButton()
            return;
        }
        facebookLoginWindow = FacebookLoginWindowController(windowNibName: "FacebookLoginWindowController")
        facebookLoginWindow?.showLoginSheet(fromWindow: self.window!)
        facebookLoginWindow?.completionHandler = {
            accessToken, error in
            if (nil == error){
                
                defaults.set(true, forKey: "fbLogin")
                defaults.synchronize()
                DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                    FacebookEventManager.requestEventUpdate(sender: nil)
                    self.updateUserProfileData()
                    
                }
            }
        }
    }
    

    func updateUserProfileData()  {
        let req = GraphRequest(graphPath: "me", parameters:[:], accessToken: AccessToken.current, httpMethod: GraphRequestHTTPMethod(rawValue: "GET")!)
        req.start({ (connection, result) in
            switch result {
            case .failed(let error):
                print(error)
                
            case .success(let graphResponse):
                if let responseDictionary = graphResponse.dictionaryValue {
                    print(responseDictionary)
//                    let firstNameFB = responseDictionary["first_name"] as? String
//                    let lastNameFB = responseDictionary["last_name"] as? String
//                    let socialIdFB = responseDictionary["id"] as? String
//                    let genderFB = responseDictionary["gender"] as? String
                    let fbName = responseDictionary["name"] as? String

//                    let pictureUrlFB = responseDictionary["picture"] as? [String:Any]
//                    let photoData = pictureUrlFB!["data"] as? [String:Any]
                    
//                    let photoUrl = photoData!["url"] as? String
//                    print(firstNameFB, lastNameFB, socialIdFB, genderFB, photoUrl)
                    let defaults = UserDefaults.standard
                    defaults.set(fbName, forKey: "FB_Profile_Name")
                    defaults.synchronize()
                    self.updateFBLoginButton()

                }
            }
        })
    }
    
}

