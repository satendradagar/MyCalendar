//
//  AppDelegate.swift
//  LaunchAtLoginHelperApp
//
//  Created by nidhi on 5/8/17.
//  Copyright © 2017 nidhi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        // Check if main app is already running; if yes, do nothing and terminate helper app
        var alreadyRunning = false;
        let running = NSWorkspace.sharedWorkspace().runningApplications;
        for app in running {
            if app.bundleIdentifier?.containsString("samy.calendar") == true {
              alreadyRunning = true;
            }
            
        }
        
        if (alreadyRunning == false) {
            let path : NSString = NSBundle.mainBundle().bundlePath
            var pathComponents  = path.pathComponents
           
           
            //NSMutableArray *pathComponents = [NSMutableArray arrayWithArray:p];
            pathComponents.removeLast()
            pathComponents.removeLast()
            pathComponents.removeLast()
            pathComponents.append("MacOS")
            pathComponents.append("calendar.app")
           
            let newPath = NSString.pathWithComponents(pathComponents)
            NSWorkspace.sharedWorkspace().launchApplication(newPath)
        }
        NSApp.terminate(nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

