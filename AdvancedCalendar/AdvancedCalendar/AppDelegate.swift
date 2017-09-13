//
//  AppDelegate.swift
//  calendar
//
//  Created by nidhi on 4/21/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa
import ServiceManagement

let AppName : String = "NEW CALENDAR APP"
let WEEK_ROWS_IN_CALENDAR : Int = 6
let WEEK_DAYS_COLUMN : Int = 7

let SUN = 1
let MON = 2
let TUE = 3
let WED = 4
let THU = 5
let FRI = 6
let SAT = 7
var popoverkey = 1

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var menu: NSMenu!
    @IBOutlet weak var preferenceWindow: NSWindow!
    
    var statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    let popover = NSPopover()
    let createEventWindowController = CreateEvent(windowNibName: "CreateEvent")
    var eventWindowController: EventWindowController =  EventWindowController(windowNibName: "EventWindowController");
    let preferencesWindowController = PreferencesWindowController(windowNibName: "PreferencesWindowController")
    var isChangedDateFormat = false
    var dateReact = NSRect()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        statusItem.target = self
        statusItem.action = #selector(AppDelegate.togglePopover(_:))
        //        statusItem.title = statusBarTitleString()
        statusItem.highlightMode = true
        //statusItem.menu = menu
        if let button = statusItem.button {
            button.action = #selector(AppDelegate.statusBarButtonClicked(_:))
            
            //4th June .
            button.sendAction( on: (NSEventMask(rawValue: UInt64(Int(NSEventMask.rightMouseDown.rawValue) | Int(NSEventMask.leftMouseDown.rawValue)))))
            
          
        }
        
        popover.contentViewController = CalendarViewController(nibName: "CalendarViewController", bundle: nil)
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTopbar), userInfo: nil, repeats: true)
//        NotificationCenter.default.addObserver(self, selector: #selector(CalendarViewController.closeWindow), name: NSNotification.Name(rawValue: "RemoveAgendaView"), object: nil)

        var startedAtLogin = false
        for app in NSWorkspace.shared().runningApplications {
            if app.bundleIdentifier == "ah.com.LauncherAdvancedCalendar" {
                startedAtLogin = true
            }
        }
        
        if startedAtLogin {
            DistributedNotificationCenter.default().post(name: Notification.Name("killme"), object: Bundle.main.bundleIdentifier!)
            print("I KILLED LAUNCHER APP")
        }
        
        

    }

    
    func updateTime() {
        
        let dateFormatter: DateFormatter = DateFormatter()
        if(PreferencesStore.sharedInstance.agendaHeaderFormat == 0){
            
            if(PreferencesStore.sharedInstance.agendaTimeFormat == 1) {
                dateFormatter.dateFormat = "EE dd MMM YYYY HH:mm"
            }
            else {
                dateFormatter.dateFormat = "EE dd MMM YYYY hh:mm a"
            }

        }
        else {
            if(PreferencesStore.sharedInstance.agendaTimeFormat == 1) {
                dateFormatter.dateFormat = "EE MMM YYYY dd HH:mm"
            }
            else {
                dateFormatter.dateFormat = "EE MMM YYYY dd hh:mm a"
            }
        }
//        print("OGOOOO: \(PreferencesStore.sharedInstance.agendaTimeFormat)")
//        print(PreferencesStore.sharedInstance.agendaTimeFormat == 1)
//        print(PreferencesStore.sharedInstance.agendaHeaderFormat)
//        print("MY DATEEE: \(dateFormatter.string(from: Date()))")
        statusItem.title = dateFormatter.string(from: Date())

    }
    
    
    func updateTopbar()  {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.init(localeIdentifier: "en_US_POSIX") as Locale!;
        print(PreferencesStore.sharedInstance.yearFormat)
        print(PreferencesStore.sharedInstance.monthFormat)
        print(PreferencesStore.sharedInstance.weekDayFormat)
        print(PreferencesStore.sharedInstance.delimiterFormat)
        print(PreferencesStore.sharedInstance.topBarFormat)
        print(" timeformat @%",PreferencesStore.sharedInstance.includeSecond)
        print("year disable key", PreferencesStore.sharedInstance.disableKey2)
        print("month disable key", PreferencesStore.sharedInstance.disableKey3)
        print("day disable key", PreferencesStore.sharedInstance.disableKey4)
        print("weekday disable key", PreferencesStore.sharedInstance.disableKey5)
 
        // big range 1
        
        var strTimeFormatter:String = ""
        var strComma:String = " "
        
        //Week Formatter
        if(PreferencesStore.sharedInstance.disableKey5 == 1) {
            var strWeek:String = ""
            
            switch PreferencesStore.sharedInstance.weekDayFormat {
            case 1:
                strWeek = "E"
                break
            case 2:
                strWeek = "EEEE"
                break
            case 3:
                strWeek = "EEEEEE"
                break
            default:
                strWeek = "E"
                break
            }
            
            strTimeFormatter.append(strWeek)
            strTimeFormatter.append(" ")
        }
        
        //Year, Month, Day Fomatter
        switch PreferencesStore.sharedInstance.delimiterFormat {
            case 1:
                strComma = " "
                break
            case 2:
                strComma = "/"
                break
            case 3:
                strComma = "."
                break
            default:
                strComma = " "
        }
    
        var strYear:String  = "YYYY"
        var strMonth:String = "MM"
        var strDay:String   = "dd"
        
        switch PreferencesStore.sharedInstance.topBarFormat {
        case 1: //Day - Month - Year
            //Day
            if (PreferencesStore.sharedInstance.disableKey4 == 1) {
                
                strDay = "dd"
                
                strTimeFormatter.append(strDay)
                
                if ( PreferencesStore.sharedInstance.disableKey3 == 1 || PreferencesStore.sharedInstance.disableKey2 == 1 ) {
                    strTimeFormatter.append(strComma)
                }
            }
            //Month
            if (PreferencesStore.sharedInstance.disableKey3 == 1) {
                
                if(PreferencesStore.sharedInstance.monthFormat == 1) {
                    strMonth = "MMM"
                } else if (PreferencesStore.sharedInstance.monthFormat == 2) {
                    strMonth = "MMMM"
                } else if (PreferencesStore.sharedInstance.monthFormat == 3) {
                    strMonth = "MM"
                }
                
                strTimeFormatter.append(strMonth)
                if ( PreferencesStore.sharedInstance.disableKey2 == 1) {
                    strTimeFormatter.append(strComma)
                }
//                strTimeFormatter.append(strComma)
            }
            //Year
            if (PreferencesStore.sharedInstance.disableKey2 == 1) {
                
                if(PreferencesStore.sharedInstance.yearFormat == 1) {
                    strYear = "YYYY"
                } else if (PreferencesStore.sharedInstance.yearFormat == 2) {
                    strYear = "YY"
                }
                strTimeFormatter.append(strYear)
            }
            
            break
        case 2: //Month - day - Year
            
            //Month
            if (PreferencesStore.sharedInstance.disableKey3 == 1) {
                
                if(PreferencesStore.sharedInstance.monthFormat == 1) {
                    strMonth = "MMM"
                } else if (PreferencesStore.sharedInstance.monthFormat == 2) {
                    strMonth = "MMMM"
                } else if (PreferencesStore.sharedInstance.monthFormat == 3) {
                    strMonth = "MM"
                }
                
                strTimeFormatter.append(strMonth)
                if ( PreferencesStore.sharedInstance.disableKey2 == 1 || PreferencesStore.sharedInstance.disableKey4 == 1 ) {
                    strTimeFormatter.append(strComma)
                }
            }
            
            //Day
            if (PreferencesStore.sharedInstance.disableKey4 == 1) {
                
                strDay = "dd"
                
                strTimeFormatter.append(strDay)
                if ( PreferencesStore.sharedInstance.disableKey2 == 1) {
                    strTimeFormatter.append(strComma)
                }
            }
            
            //Year
            if (PreferencesStore.sharedInstance.disableKey2 == 1) {
                
                if(PreferencesStore.sharedInstance.yearFormat == 1) {
                    strYear = "YYYY"
                } else if (PreferencesStore.sharedInstance.yearFormat == 2) {
                    strYear = "YY"
                }
                strTimeFormatter.append(strYear)
            }
            
            break
            
        case 3: //Year - Month - day
            
            //Year
            if (PreferencesStore.sharedInstance.disableKey2 == 1) {
                
                if(PreferencesStore.sharedInstance.yearFormat == 1) {
                    strYear = "YYYY"
                } else if (PreferencesStore.sharedInstance.yearFormat == 2) {
                    strYear = "YY"
                }
                strTimeFormatter.append(strYear)
                if ( PreferencesStore.sharedInstance.disableKey3 == 1 || PreferencesStore.sharedInstance.disableKey4 == 1 ) {
                    strTimeFormatter.append(strComma)
                }
            }
            
            //Month
            if (PreferencesStore.sharedInstance.disableKey3 == 1) {
                
                if(PreferencesStore.sharedInstance.monthFormat == 1) {
                    strMonth = "MMM"
                } else if (PreferencesStore.sharedInstance.monthFormat == 2) {
                    strMonth = "MMMM"
                } else if (PreferencesStore.sharedInstance.monthFormat == 3) {
                    strMonth = "MM"
                }
                
                strTimeFormatter.append(strMonth)
                if ( PreferencesStore.sharedInstance.disableKey4 == 1 ) {
                    strTimeFormatter.append(strComma)
                }
            }
            
            //Day
            if (PreferencesStore.sharedInstance.disableKey4 == 1) {
                strDay = "dd"
                strTimeFormatter.append(strDay)
            }
            
            break
        default:
            break
        }
        
        //Time Formatter
        var strHour:String = "hh:mm:ss a"
        
        if (PreferencesStore.sharedInstance.includeSecond == 1) {
            if (PreferencesStore.sharedInstance.TimeFormat == 1) {
                strHour = "HH:mm"
            } else {
                strHour = "hh:mm a"
            }
        } else {
            if (PreferencesStore.sharedInstance.TimeFormat == 1) {
                strHour = "HH:mm:ss"
            } else {
                strHour = "hh:mm:ss a"
            }
        }
        
        strTimeFormatter.append(" ")
        strTimeFormatter.append(strHour)
        
        dateFormatter.dateFormat = strTimeFormatter

        statusItem.title = dateFormatter.string(from: Date())
        
    }
    
    
    func statusBarTitleString() -> String {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE MMM dd hh:mm a"
        return dateFormatter.string(from: Date())
    }
    
    func changeTileStyle() -> Void {
        
    }

    @IBAction func createEvent(_ sender: AnyObject) {
        
        let button : NSButton = sender as! NSButton
      
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
        createEventWindowController.window?.makeKeyAndOrderFront(sender)
        createEventWindowController.showWindow(sender)
        NSApp.activate(ignoringOtherApps: true)

    }
    
    
    
    
    
    @IBAction func menuOptionNewEvent(_ sender: AnyObject) {
       
        //  5th June. for convert 
        let _ : NSMenuItem = sender as! NSMenuItem
        
        let button = statusItem.button
        
      
        let windowTopLeftPosition = CGPoint(x: (button!.window!.frame.minX),y: (button!.window?.frame.minY)!);
        
        // Set position of the window and display it
        createEventWindowController.window?.setFrameTopLeftPoint(windowTopLeftPosition);
        createEventWindowController.window?.makeKeyAndOrderFront(sender)
        createEventWindowController.showWindow(sender)
        NSApp.activate(ignoringOtherApps: true)

    }

    
    
    func showPopover(_ sender: AnyObject?) {
        
        if let button = statusItem.button {
//            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.maxY )
//            let buttonRect = button.bounds as NSRect;
//            if(dateReact.size.width == 0) {
//                dateReact = buttonRect
//            }
        
            popover.show(relativeTo: dateReact, of: button, preferredEdge: NSRectEdge.minY)
//            popover.positioningRect = (popover.contentViewController?.view.frame)!

            /// no closing calendar window when user click outside popover.
            if (popoverkey == 1) {
                popover.behavior = .transient
                NSApplication.shared().activate(ignoringOtherApps: true)

            }
            else if(popoverkey == 2){
                popover.behavior = .applicationDefined
                NSApplication.shared().deactivate()

            }
        }
    }
    
    func closePopover(_ sender: AnyObject?) {

//        NotificationCenter.default.post(name: Notification.Name("RemoveAgendaView"), object: nil)
        popover.performClose(sender)
        
        
    }
    
    func togglePopover(_ sender: AnyObject?) {
        let button = statusItem.button
        
        if popover.isShown  {
            
//            NotificationCenter.default.post(name: Notification.Name("RemoveAgendaView"), object: nil)
            button?.highlight(false)
            closePopover(sender)
            
            
        } else {
            button?.highlight(true)
            showPopover(sender)
            
        }
    }

    func statusBarButtonClicked(_ sender: NSStatusBarButton) {
        let event = NSApp.currentEvent!
         print("click")
        print(event.type)
        if  event.type == NSEventType.rightMouseDown {
           
            if popover.isShown {
                closePopover(sender)
            }
            else
            {
                print("1 click")
                //statusItem.menu = menu //set the menu
                statusItem.popUpMenu(menu)// show the menu
            }
            
        } else if event.type == NSEventType.leftMouseDown {
            popover.performClose(sender)

            togglePopover(sender)
            print("2 click")
            
            
        }
    }

    @IBAction func openSettingsWindow(_ sender: AnyObject) {
     
         }
    
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func openMacOSCalendar(_ sender: AnyObject) {
        
        NSWorkspace.shared().openFile("/Applications/Calendar.app")
    }
    
    @IBAction func pinCalendar(_ sender: NSMenuItem) {

        if 1 == popoverkey {
            sender.title = "Unpin Calendar"
            popoverkey = 2
        }
        else{
            popoverkey = 1
            sender.title = "Pin Calendar"

        }
    }
    
    
    @IBAction func showPreferences(_ sender: AnyObject) {
        preferencesWindowController.window?.makeKeyAndOrderFront(sender)
        preferencesWindowController.showWindow(sender)
        NSApp.activate(ignoringOtherApps: true)

    }

    @IBAction func showAboutWindow(_ sender: AnyObject) {
        
        let infoPath = "\(Bundle.main.bundlePath)/Contents/Info.plist"
        //load the plist as data in memory
        guard let plistData = FileManager.default.contents(atPath: infoPath) else { return }
        //use the format of a property list (xml)
        var format = PropertyListSerialization.PropertyListFormat.xml
        //convert the plist data to a Swift Dictionary
        guard let  plistDict = try! PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: &format) as? [String : AnyObject] else { return }
        //access the values in the dictionary
        if let value = plistDict["aKey"] as? String {
            //do something with your value
            print(value)
        }
        let versionNumber = plistDict["CFBundleShortVersionString"]
        let prodName = plistDict["CFBundleName"]
        let copyRight = plistDict["NSHumanReadableCopyright"]
//        let  html = "<html><body><a href=\"http://www.macwareinc.com\">http://www.macwareinc.com</a><body></html>";
//        let data = html.data(using: String.Encoding.ascii)
//         let credits = try! NSAttributedString(data: data!, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType], documentAttributes: nil)
        var aboutPanelDict = [String:Any]()
        aboutPanelDict["ApplicationName"] = prodName
        aboutPanelDict["Version"] = versionNumber
        aboutPanelDict["Copyright"] = copyRight
//        aboutPanelDict["Credits"] = credits
        NSApp.orderFrontStandardAboutPanel(options: aboutPanelDict)
        NSApp.activate(ignoringOtherApps: true)
//        [NSApp orderFrontStandardAboutPanelWithOptions:aboutPanelDict];
//        [NSApp activateIgnoringOtherApps:YES];
        
    }
    
    
    @IBAction func quitCalendarApp(_ sender: AnyObject) {
        NSApplication.shared().terminate(self)
    }
    
    
}

