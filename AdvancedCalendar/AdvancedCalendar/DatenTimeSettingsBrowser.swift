//
//  DatenTimeSettingsBrowser.swift
//  calendar
//
//  Created by nidhi on 5/5/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa


var dateTimeSettings : [String:[String]] = [ "Root" : ["Date" , "Time"] , "Date" :["Format" , "Order"] , "Format" : ["Year" , "Month" , "Day" , "Weekday" ,"Delimiter" ]]

class DatenTimeSettingsBrowser: NSObject , NSBrowserDelegate {
    

    
//    func browser(_ sender: NSBrowser, numberOfRowsInColumn column: Int) -> Int{
//        return 1
//    }
//
//  /*  func rootItemForBrowser(browser: NSBrowser) -> AnyObject? {
//        
//        print("root")
//    
//        return dateTimeSettings["Root"]
//    }
//
//*/
    
    
    func browser(_ browser: NSBrowser, numberOfChildrenOfItem item: Any?) -> Int{
        
        if(item == nil){
            return (dateTimeSettings["Root"]?.count)!
        }
        else
        {
             if( dateTimeSettings[item as! String] != nil )
             {
               return dateTimeSettings[item as! String]!.count
            }
             else{
                return 0
            }
        }
        
    }
    

    func browser(_ browser: NSBrowser, objectValueForItem item: Any?) -> Any? {
        print("objectValueForItem")
         print(item as Any)
        return item as! String
    }
    
    func browser(_ browser: NSBrowser, child index: Int, ofItem item: Any?) -> Any {
        
        var childValues : [String]
         if(item == nil){
            childValues = dateTimeSettings["Root"]!
        }
         else {
            childValues = dateTimeSettings[item as! String]!
            
        }
        // print(item)
        if(childValues.isEmpty == false){
            return childValues[index]
        }
        else
        {
            return "test"
        }
    }
    
    
    func browser(_ browser: NSBrowser, isLeafItem item: Any?) -> Bool {
        
        if(item == nil){
            return false
        }
        else {
            if( dateTimeSettings[item as! String] != nil )
            {
                return false
                
            }
            else {
                return true
            }
            
        }

    }
       
    /*
    func browser(sender: NSBrowser, willDisplayCell cell: AnyObject, atRow row: Int, column: Int){
        let theCell = cell as? NSBrowserCell
        theCell?.title = "test\(row)\(column)"

    
    }
    */
    

}
