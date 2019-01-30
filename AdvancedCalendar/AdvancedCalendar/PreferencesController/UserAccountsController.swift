/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    Contains the `ImageCollectionListController` view controller subclass, which displays a list of `ImageCollection`s.
*/

import Cocoa
import Facebook_Mac_Core
import FacebookEventManager
import Google_Event_Manager


/**
    `ImageCollectionListController` displays a list of `ImageCollection`s in an
    `NSOutlineView`. It can be given a selection handler to report when an 
    `ImageCollection` is selected.
*/
class UserAccountsController: NSViewController, NSOutlineViewDataSource, NSOutlineViewDelegate {
    // MARK: Properties
    var facebookLoginWindow: FacebookLoginWindowController?
    var googleLoginManager = GoogleLoginManager.sharedInstance

    @IBOutlet var outlineView: NSOutlineView!
    @IBOutlet var accountsMenu: NSMenu!

    let originalCollection = PreferencesStore.sharedInstance.userAccountsObjects()

    override var nibName: String {
        return "ImageCollectionListController"
    }
    
    /// The identifier used for collection rows in the outline view
    static let collectionCellIdentifier = "DataCell"
    
    static func registerActiveAccounts(){
        let collections = PreferencesStore.sharedInstance.userAccountsObjects()
        for acc in collections {
            if acc.status == 1{
                if let accID = acc.identifier{
                 
                    switch (accID) {
                    case "com.facebook":
                        print(accID)
                        FacebookEventManager.refreshAccessToken(); FBEventStroreManger.sharedStore.setupRefreshFacebookEventsTimer()
                        //                menuObj.status = 1
                    //                syncObjectState()
                    case "com.google":
                        print(accID)
                        GoogleEventStoreMaanger.sharedStore.setupRefreshEventsTimer()
                    default:
                        print(accID)
                        
                    }
                }
            }
        }

    }
    
    // MARK: Image Collection Management

    var accountSelectionHanldler: ((PreferenceAccount?) -> Void)?

    var imageCollections = [PreferenceAccount]() {
        didSet {
            guard isViewLoaded else { return }

//            reloadOutlineAndSelectFirstItemIfNecessary()
        }
    }

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.imageCollections = nil
        reloadOutlineAndSelectFirstItemIfNecessary()
        print("Google:\(signedInUsername())")
    }

    func reloadOutlineAndSelectFirstItemIfNecessary() {
        var filteredColls = [PreferenceAccount]()
        let collections = originalCollection
        for acc in collections {
            if acc.status == 1{
                filteredColls.append(acc)
            }
        }
        self.imageCollections = filteredColls
        let oldSelection = outlineView.selectedRowIndexes

        outlineView.reloadData()

        if oldSelection.count == 0 {
            /*
                If the outline view didn't already have a selection, select the
                first `ImageCollection` (if one exists).
            */

            guard !imageCollections.isEmpty else { return }

            let firstIndexSet = IndexSet(integer: 0)

            outlineView.selectRowIndexes(firstIndexSet, byExtendingSelection: false)

            /*
                Programmatically changing the selection doesn't send a notification (it only
                happens when the user changes it). So, explicitly handle the new selection.
            */
        }
        else {
            // If there was an old selection, restore that old selection.
            outlineView.selectRowIndexes(oldSelection, byExtendingSelection: false)
        }
        handleSelectionChanged()

    }

    // MARK: OutlineView Data Source / Delegate

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return imageCollections[index]
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        // The root item has each collection as its children.
        if item == nil {
            return imageCollections.count
        }
        
        return 0
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        guard let collection = item as? PreferenceAccount else { return nil }

        let view = outlineView.make(withIdentifier: UserAccountsController.collectionCellIdentifier, owner: self) as! NSTableCellView
        if let label = collection.title {
            view.textField?.stringValue = label

        }
//        view.imageView?.image = collection.tableViewIcon
        
        /*
            Turn on `translatesAutoresizingMaskIntoConstraints` so the outline view
            can manage the size and position of the views, specifically when the
            'Sidebar Icon Size' changes. With this on, the source nib must not be
            adding any runtime constraints to these views.
        */
        view.textField?.translatesAutoresizingMaskIntoConstraints = true
        view.imageView?.translatesAutoresizingMaskIntoConstraints = true
        view.imageView?.isHidden = true
        return view
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }

    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        return false
    }

    func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool {
        return item is PreferenceAccount
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard outlineView == notification.object as? NSOutlineView else { return }

        handleSelectionChanged()
    }

    fileprivate func handleSelectionChanged() {
        guard let imageCollectionSelectionHandler = accountSelectionHanldler else { return }

        let selectedRows = outlineView.selectedRowIndexes

        // Of the selected rows, get the ones that represent an `ImageCollection`.
        let imageCollections = selectedRows.flatMap { row in
            /*
                If the row doesn't represent an image collection, the result will
                be filtered out.
            */
            return outlineView.item(atRow: row) as? PreferenceAccount
        }
        if imageCollections.count > 0 {
            imageCollectionSelectionHandler(imageCollections.first)
        }
        else{
            imageCollectionSelectionHandler(nil)

        }
    }

    // MARK: IBActions

    @IBAction func addSocialAccount(_ sender: NSButton!) {

        accountsMenu.removeAllItems()
        for acc in originalCollection {
            if acc.status == 0{
                let newItem = NSMenuItem(title: acc.title ?? "Error", action: #selector(userDidChooseAccount(sender:)), keyEquivalent: "")
                accountsMenu.addItem(newItem)
                newItem.representedObject = acc
            }
        }
        accountsMenu.popUp(positioning: accountsMenu.item(at: 0), at: sender.bounds.origin, in: self.view)
    }
    
    @IBAction func removeSocialAccount(_ sender: NSButton!) {
        let selectedRows = outlineView.selectedRowIndexes
        let accounts = selectedRows.flatMap { row in
            /*
             If the row doesn't represent an Account collection, the result will be filtered out.
             */
            return outlineView.item(atRow: row) as? PreferenceAccount
        }
        if accounts.count > 0 {
            let selectedAccount = accounts[0]
            selectedAccount.status = 0
            if let accID = selectedAccount.identifier{
                
                switch (accID) {
                case "com.facebook":
                    print(accID)
                    FBEventStroreManger.sharedStore.removeFacebookCalendar()
                    //                menuObj.status = 1
                //                syncObjectState()
                case "com.google":
                    print(accID)
                    googleLoginManager.logoutUser()
                default:
                    print(accID)
                    
                }
            }
            syncObjectState()
            reloadOutlineAndSelectFirstItemIfNecessary()
        }
        
        
//        let selectedRows = outlineView.selectedRowIndexes
//
//        // Of the selected rows, get the ones that represent an `ImageCollection`.
//        let imageCollections = selectedRows.flatMap { row in
//            /*
//             If the row doesn't represent an image collection, the result will
//             be filtered out.
//             */
//            return item = outlineView.item(atRow: row) as? PreferenceAccount
//        }
        
    }
    
    @IBAction func userDidChooseAccount(sender: NSMenuItem) {
        
        if let menuObj = sender.representedObject as? PreferenceAccount{
            
            let accID = menuObj.identifier ?? "Default"
            switch (accID) {
            case "com.facebook":
                print(accID)
                loginWithFacebook(acount: menuObj)
//                menuObj.status = 1
//                syncObjectState()
            case "com.google":
                print(accID)
                self.didClickGoogleLogin(acount: menuObj)
            default:
                print(accID)

            }
        }
    }
    
    func loginWithFacebook(acount:PreferenceAccount)  {
        
        facebookLoginWindow = FacebookLoginWindowController(windowNibName: "FacebookLoginWindowController")
        facebookLoginWindow?.completionHandler = {
            accessToken, error in
            if (nil == error){
                
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "fbLogin")
                defaults.synchronize()
                
                FacebookEventManager.requestEventUpdate(sender: nil)
                self.updateFacebookUserProfileData(acount: acount)
            FBEventStroreManger.sharedStore.setupRefreshFacebookEventsTimer()

            }
        }

        facebookLoginWindow?.showLoginSheet(fromWindow: self.view.window!)
    }
    
    
    func updateFacebookUserProfileData(acount:PreferenceAccount)  {
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
                    acount.status = 1
                    self.syncObjectState()
                    
                }
            }
        })
    }
    
    func didClickGoogleLogin(acount:PreferenceAccount) -> Void {
        
        googleLoginManager.loginUser { (isSuccess) in
            acount.status = 1
            self.syncObjectState()
            let defaults = UserDefaults.standard
            defaults.set(self.signedInUsername(), forKey: "Google_Profile_Name")
            defaults.synchronize()
            GoogleEventStoreMaanger.sharedStore.setupRefreshEventsTimer()

        }
        
    }
    
    func didClickGoogleLogout(acount:PreferenceAccount) -> Void {
        
        googleLoginManager.logoutUser()
        acount.status = 1
        self.syncObjectState()
    }
    
func signedInUsername() -> String? {
        // Get the email address of the signed-in user
    let auth: GTMFetcherAuthorizationProtocol? = googleLoginManager.calendarService()?.authorizer
    let isSignedIn: Bool? = auth?.canAuthorize
    if isSignedIn ?? false {
        return auth?.userEmail
    } else {
        return nil
    }
}
    
func isSignedIn() -> Bool {
    let name = signedInUsername()
    return name != nil
}
//    func updateFBLoginButton()  {
//        let defaults = UserDefaults.standard
//        let isFBLogin = defaults.bool(forKey:"fbLogin")
//        if  isFBLogin == true {
//            btn_FBlogin.title = "Logout"
//        }
//        else{
//            btn_FBlogin.title = "Login"
//        }
//    }

    func syncObjectState(){
        var accs = [[String:Any?]]()
        for item in originalCollection {
            accs.append(item.dictionaryRepresentation())
        }
        PreferencesStore.sharedInstance.saveAccounts(accounts: accs)
        reloadOutlineAndSelectFirstItemIfNecessary()

    }
}

//For preferences window
extension PreferencesStore{
    
    func saveAccounts(accounts:[[String:Any?]])
    {
        self.defaults.set(accounts, forKey: "ThirdPartyAccounts")
    }
    
    func accounts() -> [[String:Any]]
    {
        if let accs = self.defaults.object(forKey: "ThirdPartyAccounts") as?[[String:Any]] {
            return accs
        }
        else{//blank items
            let accs = [["title" : "Facebook","identifier" : "com.facebook","status" : 0],["title" : "Google","identifier" : "com.google","status" : 0]]
            return accs
        }
    }
    
    func userAccountsObjects() -> [PreferenceAccount] {
        var prefAccounts = [PreferenceAccount]()
        for item in self.accounts() {
            let acconut = PreferenceAccount(withTitle: item["title"] as? String, inIdentifier: item["identifier"]as? String, inStatus: item["status"]as? Int)
            prefAccounts.append(acconut)
        }
        return prefAccounts
    }
}
