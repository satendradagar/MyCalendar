//
//  FBLoginController.swift
//  FacebookWebLogin
//
//  Created by Satendra Singh on 19/11/17.
//  Copyright © 2017 Satendra. All rights reserved.
//

import Foundation
import Cocoa
import Facebook_Mac_Core

let kFBStoreAccessToken = "FBAStoreccessToken"
let kFBStoreTokenExpiry = "FBStoreTokenExpiry"
let kFBStoreAccessPermissions = "FBStoreAccessPermissions"

 public class PhFacebook: NSObject {
    var appID = ""
    var delegate: FBTokenFacebookDelegate?
   public var webViewController: FacebookLoginController?
    private var authToken: FBAuthenticationToken?
    private var permissions = ""
        // MARK: Initialization

     public init( appID: String, andDelegate delegate: FBTokenFacebookDelegate?) {
        super.init()
        if appID != "" {
            self.appID = appID
        }
        self.delegate = delegate
        let bundle = Bundle(for: PhFacebook.self)
        // Don't retain delegate to avoid retain cycles
//        let nib = NSNib.init(nibNamed: "FacebookLoginController", bundle: bundle)
        webViewController = FacebookLoginController(nibName: "FacebookLoginController", bundle: bundle)
        authToken = nil
        print("Initialized with AppID \(self.appID)")
        
    }

    func notifyDelegate(for tokenIn:FBAuthenticationToken? , withError errorReason: String?) {
        var result = [AnyHashable: Any]()
        if let token = tokenIn  {
            // Save it to user defaults
            let defaults: UserDefaults? = UserDefaults.standard
            defaults?.set(token.authenticationToken, forKey: kFBStoreAccessToken)
            if (token.expiry != nil) {
                defaults?.set(token.expiry, forKey: kFBStoreTokenExpiry)
            }
            else {
                defaults?.removeObject(forKey: kFBStoreTokenExpiry)
            }
            defaults?.set(token.permissions, forKey: kFBStoreAccessPermissions)
            result["valid"] = (1)
            result["token"] = token.authenticationToken
            result["expiry"] = token.expiry
            result["permissions"] = token.permissions
            self.getPermanentToken(tempToken: token.authenticationToken)
//            return

        }
        else {
            result["valid"] = (0)
            result["error"] = errorReason
        }
        if let del = delegate{
                del.tokenResult(result)
            
        }
        
    }

   public func clearToken() {
        authToken = nil
    }
    
   public func invalidateCachedToken() {
        clearToken()
        let defaults: UserDefaults? = UserDefaults.standard
        defaults?.removeObject(forKey: kFBStoreAccessToken)
        defaults?.removeObject(forKey: kFBStoreTokenExpiry)
        defaults?.removeObject(forKey: kFBStoreAccessPermissions)
        // Allow logout by clearing the left-over cookies (issue #35)
//        let facebookUrl = URL(string: LoginURLConstants.URLs.URL)
        let facebookSecureUrl = URL(string: LoginURLConstants.URLs.SecureURL)
        let cookieStorage = HTTPCookieStorage.shared
//        let cookies = (cookieStorage.cookies(for: facebookUrl!))! + cookieStorage.cookies(for: facebookSecureUrl!) ?? [Any]()
        let cookies =  cookieStorage.cookies(for: facebookSecureUrl!)

        for cookie: HTTPCookie in cookies! {
            cookieStorage.deleteCookie(cookie)
        }
    }
    
    func setAccessToken(_ accessToken: String, expires tokenExpires: TimeInterval = 100, permissions perms: String) {
        clearToken()
        if accessToken != "" {
            authToken = FBAuthenticationToken(token: accessToken, secondsToExpiry: tokenExpires, permissions: perms)
            
        }
    }

    // permissions: an array of required permissions
    //              see http://developers.facebook.com/docs/authentication/permissions
    // canCache: save and retrieve token locally if not expired
   public func getAccessToken(forPermissions permissions: [String], cached canCache: Bool) {
        var validToken = false
    let scope: String = permissions.joined(separator: ",")

        if canCache && authToken == nil {
            let defaults: UserDefaults? = UserDefaults.standard
            let accessToken: String? = defaults?.string(forKey: kFBStoreAccessToken)
            let date = defaults?.object(forKey: kFBStoreTokenExpiry) as? Date
            let perms: String? = defaults?.string(forKey: kFBStoreAccessPermissions)
            if (accessToken != nil) && (perms != nil) {
                
                // Do not notify delegate yet...

                self.setAccessToken(accessToken!, expires: (date?.timeIntervalSinceNow)!, permissions: perms!)
            }
        }
        if(authToken?.permissions.caseInsensitiveCompare(scope) == ComparisonResult.orderedSame){
            // We already have a token for these permissions; check if it has expired or not
            if authToken?.expiry == nil || (authToken?.expiry)! < Date() {
                validToken = true
            }
        }

        if validToken {
            notifyDelegate(for: authToken, withError: nil)
        }
        else {
            clearToken()
            // Use _webViewController to request a new token
            var authURL = ""
            if scope.count > 0 {
                authURL = LoginURLConstants.URLs.authUrlWith(clientID: appID, andScode: scope)
            }
            else {
                authURL = LoginURLConstants.URLs.authUrlWith(clientID: appID)

            }

            if let del = delegate{
                    if del.needsAuthentication(authURL, forPermissions: scope) {
                        // If needsAuthentication returns YES, let the delegate handle the authentication UI
                }
            }
            // Retrieve token from web page
            
            if webViewController == nil {
                webViewController = FacebookLoginController.init()
            }
            // Prepare window but keep it ordered out. The _webViewController will make it visible
            // if it needs to.
            webViewController?.loginControler = self;
            webViewController?.permissions = scope;
//            let url = URL(string: authURL)
//            let request = URLRequest(url:url!)
//            webViewController?.webView.load(request)
            webViewController?.webView.mainFrameURL = authURL

     }
    }
    
    func setAccessToken(_ accessToken: String, expires tokenExpires: TimeInterval, permissions perms: String, error errorReason: String) {
        self.setAccessToken(accessToken, expires: tokenExpires, permissions: perms)
        notifyDelegate(for: authToken, withError: errorReason)
    }
    
    func getPermanentToken(tempToken:String) -> Void{
        //["grant_type":"fb_exchange_token","client_id":self.appID,"client_secret"="798db73d3f18f375e0d376ed6ef12d81"]
//        let params = ["username":"john", "password":"123456"] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: "https://graph.facebook.com/v2.10/oauth/access_token?grant_type=fb_exchange_token&client_id=\(self.appID)&client_secret=3dd54059262b4c2a900df09f5a8085a6&fb_exchange_token=\(tempToken)")!)
        request.httpMethod = "GET"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })
        
        task.resume()
        
//        let req = GraphRequest(graphPath: "oauth/access_token", parameters:["grant_type":"fb_exchange_token","fb_exchange_token":tempToken,"client_id":self.appID,"client_secret":"3dd54059262b4c2a900df09f5a8085a6"], accessToken: AccessToken.current, httpMethod: GraphRequestHTTPMethod(rawValue: "GET")!)
//        req.start({ (connection, result) in
//            switch result {
//            case .failed(let error):
//                print(error)
//
//            case .success(let graphResponse):
//                if let responseDictionary = graphResponse.dictionaryValue {
//                    //                    print(responseDictionary)
//                    if let eventData = responseDictionary["data"] as? [[String:Any]]{
//
////                        FBEventStroreManger.sharedStore.updateEvents(eventsDict: eventData)
//
//                    }
//
////                    if let paging = responseDictionary["paging"] as? [String:Any] {
////                        if let cursors = paging["cursors"] as? [String:Any] {
////                            //                            self.refreshEventsWithCompletion(parameters:cursors)
////
////                            if let after = cursors["after"] as? String {
////
////                                print("\n\n\n\n\ntrying to load next page")
////
//////                                self.refreshEventsWithCompletion(parameters:["after":after])
////                            }
////
////                        }
////                    } else {
////                        print("Can't read next!!!")
////                    }
//
//                }
//            }
//        })
    }
    
    func accessToken() -> String? {
        return authToken?.authenticationToken
    }
    
}

public protocol FBTokenFacebookDelegate : NSObjectProtocol {
    
    func tokenResult(_ result: [AnyHashable: Any])
    
    func requestResult(_ result: [AnyHashable: Any])
    // needsAuthentication is called before showing the authentication WebView.
    // If it returns YES, the default login window will not be shown and
    // your application is responsible for the authentication UI.
    func needsAuthentication(_ authenticationURL: String, forPermissions permissions: String) -> Bool
  
}
