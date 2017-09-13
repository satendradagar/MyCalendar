
//  calendarTable.swift
//  calendar
//
//  Created by nidhi on 4/21/17.
//  Copyright © 2017 nidhi. All rights reserved.
//




import Cocoa
import EventKit
var KEY_CALENDAR_RELOAD = Notification.Name("kCloseSideMenu")

class calendarTable:  NSObject, NSTableViewDataSource,NSTableViewDelegate {
   
    @IBOutlet weak var calendarTable: NSTableView!
    @IBOutlet weak var monthLabel: NSTextField!
   
    
    var eventWindowController: EventWindowController =  EventWindowController(windowNibName: "EventWindowController");
    //  4th June.
    var array = [[calendarCell]](repeating: [calendarCell](repeating: calendarCell(), count: 7), count: 6)
    var calendarDataInstance = CalendarData.sharedInstance
    var highlightColumn = PreferencesStore.sharedInstance.headerDayHighLight
    var prevSelCellView : NSTableCellView?
    var currSelCellView : NSTableCellView?
    var iconImage = NSImageView();
    
    

    func removeAgendaView() -> Void {
        eventWindowController.closeWindow()
        prevSelCellView = nil
        currSelCellView = nil
        iconImage.removeFromSuperview()
        

    }
    
    
    func reloadCalendar() -> Void {
        highlightColumn = PreferencesStore.sharedInstance.headerDayHighLight
        calendarDataInstance.loadCalendarData()
        calendarTable.reloadData();
    }
    
    func ReloadCalendar() -> Void {

        
    }
    
    func numberOfRows(in aTableView: NSTableView) -> Int{
        
        
        
        array =  calendarDataInstance.selectedMonthCalArray
        
        let dateFormatter: DateFormatter = DateFormatter()
        let months = dateFormatter.monthSymbols
        let monthSymbol = months?[calendarDataInstance.selectedMonth-1]
        
        monthLabel.stringValue = monthSymbol! + ", " + "\(calendarDataInstance.selectedYear)"
        
        return  WEEK_ROWS_IN_CALENDAR
    
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let indexOfColumn = tableView.tableColumns.index(of: tableColumn!)
        
        let day = array[row][indexOfColumn!].day
        let month = array[row][indexOfColumn!].month
        
//        let unitFlags: NSCalendar.Unit = [.day, .month, .year]
//        let dateTodayComponents = NSCalendar.currentCalendar().components(unitFlags, fromDate: calendarDataInstance.dateToday)
        let unitFlags = Set<Calendar.Component>([.day,.month,.year])
        
        let dateTodayComponents = Calendar.current.dateComponents(unitFlags, from: Date() as Date)
      
        
        var cellView : NSTableCellView
        
        let cell = array[row][indexOfColumn!]
        
        if (((cell.events.isEmpty == false) && (cell.events.count > 0)) || ( ( dateTodayComponents.day == day ) && (dateTodayComponents.month == month ))) {
            let numberOfEventsOnThisDay  = cell.events.count
            
            cellView = tableView.make(withIdentifier: "currentDateHasEvent", owner: self) as! NSTableCellView
            cellView.prepareForReuse()
           
            
            for case let imageView as NSImageView in cellView.subviews {
                
                if imageView.identifier == "todayDateImage" {
                    
                    if( (( dateTodayComponents.day == day ) && (dateTodayComponents.month == month )) ) {
                        
                        imageView.isHidden = false
                    }
                    else
                    {
                        imageView.isHidden = true
                    }
                    
                }
                else {
                    cellView.subviews.remove( at: cellView.subviews.index(of: imageView)!)
                }
            }
            
            for case let button as NSButton in cellView.subviews {
                button.image = NSImage(named: "whiteTableCell45.png")
                button.identifier =  "\(row)" + "-" + "\(indexOfColumn!)"
                
                
                
                if(numberOfEventsOnThisDay > 0)
                {
                    let maxEventsInOneRow = 4
                    // June 7th maxEventsInOneRowFloat
                    let _ : CGFloat = 4.0
                    var row  : Int
                    var col  : Int
                    
                    let numberOfEventsOnThisDayFloat : CGFloat = CGFloat( cell.events.count )
                    let imageSideLenFloat : CGFloat = 5.0
                    let colFloat : CGFloat
                    
                    if( numberOfEventsOnThisDay > maxEventsInOneRow)
                    {
                        row = 2
                        col = 4
                        colFloat = 4
                    }
                    else
                    {
                        row = 1
                        col = numberOfEventsOnThisDay
                        colFloat = numberOfEventsOnThisDayFloat
                    }
                    
                  // ND  var y = cellView.frame.minY + 17
                    var y : CGFloat = 0.0 + 17.0
                    
                    print("\(cellView.frame.minX ) \(cellView.frame.minY) \(cellView.bounds.minX) \(cellView.bounds.minY)  \(day) \(month)")
                     print("\(cellView.frame.maxX ) \(cellView.frame.maxY) \(cellView.bounds.maxX) \(cellView.bounds.maxY)  \(day) \(month)")
                    //3
                    for rowIndex in 1 ... row {
                        var x = ((cellView.frame.minX + cellView.frame.size.width ) / 2)
                        
                       //ND x = ((cellView.frame.minX + cellView.frame.maxX / 2 )  )
                         x = (( 66 / 2 )  )
                        x = x - (((colFloat  * imageSideLenFloat) / 2) as CGFloat)
                        
                        // June 7th for colIndex in 1 ... col
                        for _ in 1 ... col  {
                            let iconImage = NSImageView();
                            
//                            CGRectMake(12,4,17,9);
//                             CGRectMake(button.frame.minX ,button.frame.minY ,button.frame.minX + 50,button.frame.minY - 60);
//                           
                           
                            iconImage.image = NSImage.init(named: "Event_Point_4px.png")
                            
                            iconImage.frame = CGRect(x: x  , y: y , width: imageSideLenFloat  ,height: imageSideLenFloat );
                          //  iconImage.alignmentRectForFrame(iconImage.frame)
                            cellView.addSubview(iconImage);
                            //cellView.imageView!.image = NSImage(named:"Event Point_5px.png")
                            x = x + imageSideLenFloat
                            
                        }
                        
                        y = y - imageSideLenFloat
                        col = numberOfEventsOnThisDay - rowIndex * maxEventsInOneRow
                        
                    } // 3
                    
                }
                
            } //2
            
            
        }
        else{
            cellView = tableView.make(withIdentifier: "day", owner: self) as! NSTableCellView
            for case let button as NSButton in cellView.subviews {
                button.identifier =  "\(day)" + "-" + "\(month)"
                //   button.title = "\(day)"
            }
        }
        
        
        
        cellView.textField?.stringValue = "\(day)"
        if month != calendarDataInstance.selectedMonth {
            cellView.textField?.drawsBackground = false
            cellView.textField?.textColor = NSColor.gray
        }
        else {
            cellView.textField?.textColor = NSColor.black
            cellView.textField?.drawsBackground = false
        }
        
        cellView.needsDisplay = true
        
        if (self.highlightColumn[indexOfColumn!] == true)
        {
            cellView.wantsLayer = true
            cellView.layer?.backgroundColor = CGColor(red: (164/255), green: (205/255), blue: 1, alpha: 1)
            
        }
        else
        {
             cellView.wantsLayer = false
        }
        
        
        
        return cellView
        
    }

    func doHighlightDay( _ col : Int){
        
        // get title from the label at column number
    
    }
    
    @IBAction func onEmptyDateClicked(_ sender: Any) {
        let button = sender as! NSButton
        currSelCellView = button.superview as? NSTableCellView
        let appDel = NSApplication.shared().delegate as! AppDelegate;
        appDel.createEvent(sender as AnyObject);
        
        
    }
    
    @IBAction func calendarButtonClicked(_ sender: AnyObject) {
        
        let button = sender as! NSButton
       // button.transparent = false
        
        // June 7 th print(button.identifier) print(button.superview)
        
        print(button.identifier!); print(button.superview!)
        print(button.identifier as Any)
        print(button.superview as Any)
        
       
         eventWindowController = EventWindowController(windowNibName: "EventWindowController");
       
        
        if(prevSelCellView != nil){
        for case let imageView as NSImageView in prevSelCellView!.subviews
        {
            if (imageView.identifier == "selectionIcon")
            {
                imageView.removeFromSuperview()
            }
            prevSelCellView?.needsDisplay = true
        }
        }
        
        currSelCellView = button.superview as? NSTableCellView
        
        calendarDataInstance.userSelectedDateIdentifier = button.identifier!
        
        var iden = calendarDataInstance.userSelectedDateIdentifier
        var indexes = iden.characters.split{$0 == "-"}.map(String.init)
        // June var calendarRow
        let calendarRow = Int(indexes[0])!
        let calendarCol = Int(indexes[1])!
        
        if (  calendarDataInstance.selectedMonthCalArray[calendarRow][calendarCol].events.count > 0 )
            
        { let eventFrame = NSApp.currentEvent!.window!.frame
            _ = eventFrame.origin;
            _ = eventFrame.size;
            
            // Calculate the position of the window to
            // place it centered below of the status item
            let CalendarWindowFrame = calendarTable.window?.frame
            
            let pPoint = NSPoint ( x: calendarTable.frame.minX  , y: calendarTable.frame.maxY )
            _ =  calendarTable.convert(pPoint, from: nil)
            
            _ = (CalendarWindowFrame?.minX)! + 50
            let CalendarWindowPosY = CalendarWindowFrame?.maxY
            
            //  let CalendarWindow = windowFrame!.size;
            
            _ = CGPoint(x: (CalendarWindowFrame?.minX)!  , y: CalendarWindowPosY!);
            
                   eventWindowController.window?.makeKeyAndOrderFront(sender)
            
            eventWindowController.setData(button.identifier!)
            eventWindowController.setWindowPosRelativeToFrame(CalendarWindowFrame!)
             if (prevSelCellView?.identifier != currSelCellView?.identifier ){
                
//                eventWindowController.showWindow(sender)
                
                // ND  var y = cellView.frame.minY + 17
                let y : CGFloat = 40
                let x : CGFloat = 30
                
//                let iconImage = NSImageView();
                
                
                iconImage.identifier = "selectionIcon"
                iconImage.image = NSImage.init(named: "SelectedDatePoint_5px.png")
                
                iconImage.frame = CGRect(x: x  , y: y , width: 5  ,height: 5 );
            
                currSelCellView!.addSubview(iconImage);
                prevSelCellView = currSelCellView
                eventWindowController.showWindow(sender)

            }
            else
             {
//                let appDelegate = NSApplication.shared().delegate as! AppDelegate
//                appDelegate.eventWindow()
                
                
                eventWindowController.closeWindow()
                 prevSelCellView = nil
            }
        }
        
    }
    @IBAction func showPreviousMonth(_ sender: AnyObject) {
        
        calendarDataInstance.showPreviousMonth(sender)
        self.calendarTable.reloadData()
        let dateFormatter: DateFormatter = DateFormatter()
        
        let months = dateFormatter.monthSymbols
        let monthSymbol = months?[calendarDataInstance.selectedMonth-1] // month - from your date components
        
        
        monthLabel.stringValue = monthSymbol! + ", " + "\(calendarDataInstance.selectedYear)"
        

    }
    
    @IBAction func showNextMonth(_ sender: AnyObject) {
        
         calendarDataInstance.showNextMonth(sender)
        self.calendarTable.reloadData()
        
        let dateFormatter: DateFormatter = DateFormatter()
        
        let months = dateFormatter.monthSymbols
        let monthSymbol = months?[calendarDataInstance.selectedMonth-1] // month - from your date components
        
        
        monthLabel.stringValue = monthSymbol! + ", " + "\(calendarDataInstance.selectedYear)"
        
    }
}
