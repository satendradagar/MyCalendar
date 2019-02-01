//
//  IntegrationTabController.swift
//  AdvancedCalendar
//
//  Created by Satendra Dagar on 16/02/18.
//  Copyright © 2018 Satendra Singh. All rights reserved.
//

import Foundation
import Cocoa

class IntegrationTabController: NSTabViewItem {
    
    @IBOutlet var splitView: NSSplitView!
    @IBOutlet var accountListController: UserAccountsController!
    @IBOutlet var accountDetailsController: AccountDetailsController!

//    @IBOutlet var accountDetailsView: NSView!

//    @IBOutlet var btn_enableTimeSetting: NSButton!
//    @IBOutlet var btn_24Hours: NSButton!
//    @IBOutlet var btn_12Hours: NSButton!
//    @IBOutlet var btn_ShowSecond: NSButton!
//    @IBOutlet var btn_FBlogin: NSButton!

/* Disabled social integration
    override func awakeFromNib() {
        
        accountListController.accountSelectionHanldler = ({(selected) in
            print("hello\(selected)")
            if let acc = selected{
                let accID = acc.identifier ?? "Default"
                switch (accID) {
                case "com.facebook":
                    print(accID)
                    let fbDetails  = FacebookAccount.instance();
                    self.accountDetailsController.configureWithAccountController(newAccountController: fbDetails)
                case "com.google":
                    print(accID)
                    let googleDetails  = GoogleAccount.instance();
                    self.accountDetailsController.configureWithAccountController(newAccountController:googleDetails)

                default:
                    print(accID)
                    self.accountDetailsController.configureWithAccountController(newAccountController:nil)

                }
            }
            else{
                self.accountDetailsController.configureWithAccountController(newAccountController:nil)

            }
        })
    }
 */
}
