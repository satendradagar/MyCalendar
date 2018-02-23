//
//  AccountDetailsController.swift
//  AdvancedCalendar
//
//  Created by Satendra Dagar on 22/02/18.
//  Copyright © 2018 Satendra Singh. All rights reserved.
//

import Foundation
import Cocoa

class AccountDetailsController: NSViewController {
    
    func configureWithAccountController(newAccountController:NSViewController?) {
        let child = self.childViewControllers
        if (child.count > 0){
            let oldController = child[0]
            oldController.view.removeFromSuperview()
            oldController.removeFromParentViewController()
        }
        
        if let newController = newAccountController {
            
            self.addSSChildViewController(child: newController)

        }
    }
}
