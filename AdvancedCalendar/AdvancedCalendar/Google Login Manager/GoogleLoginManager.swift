//
//  GoogleLoginManager.swift
//  AdvancedCalendar
//
//  Created by Satendra Dagar on 05/04/18.
//  Copyright © 2018 Satendra Singh. All rights reserved.
//

import Foundation
import Google_Event_Manager

// This is the URL shown users after completing the OAuth flow. This is an information page only and
// is not part of the authorization protocol. You can replace it with any URL you like.
// We recommend at a minimum that the page displayed instructs users to return to the app.
let kSuccessURLString = "http://openid.github.io/AppAuth-iOS/redirect/";

// Keychain item name for saving the user's authentication information
let kGTMAppAuthKeychainItemName = "Advance Calendar: Google Auth";

let clientSecret = "YVmUZWTVO5pwHWztT4xKdKgu";
let clientID = "753256904541-p7pq7083ocr4976l9i5smu1ejor8393o.apps.googleusercontent.com";

class GoogleLoginManager: NSObject {
    
    var redirectHTTPHandler :OIDRedirectHTTPHandler?;
    var service: GTLRCalendarService? = nil

    static let sharedInstance = GoogleLoginManager()

    func loginUser(_ completion:@escaping (_ isSucces:Bool)->() ) -> Void {
        
        let successURL = URL(string: kSuccessURLString)
        // Starts a loopback HTTP listener to receive the code, gets the redirect URI to be used.
        redirectHTTPHandler = OIDRedirectHTTPHandler(successURL: successURL)
        var error: Error?
        var localRedirectURI: URL? = redirectHTTPHandler?.startHTTPListener(error as? AutoreleasingUnsafeMutablePointer<NSError?>)
        if localRedirectURI == nil {
            print("Unexpected error starting redirect handler \(error)")
            return
        }
        // Builds authentication request.
        let configuration: OIDServiceConfiguration = GTMAppAuthFetcherAuthorization.configurationForGoogle()
        let scopes = [kGTLRAuthScopeCalendar, OIDScopeEmail]
        let request = OIDAuthorizationRequest(configuration: configuration, clientId: clientID, clientSecret: clientSecret, scopes: scopes, redirectURL: localRedirectURI!, responseType: OIDResponseTypeCode, additionalParameters: nil)
        // performs authentication request
        // Using the weakSelf pattern to avoid retaining self as block execution is indeterminate.
        redirectHTTPHandler?.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request) { (authState, error) in
            // Brings this app to the foreground.
            //            NSRunningApplication.current.activate(options: [.activateAllWindows, .activateIgnoringOtherApps])
            if let authSt = authState {
                // Creates a GTMAppAuthFetcherAuthorization object for authorizing requests.
                var gtmAuthorization = GTMAppAuthFetcherAuthorization(authState: authSt)
                // Sets the authorizer on the GTLRYouTubeService object so API calls will be authenticated.
                self.calendarService()?.authorizer = gtmAuthorization
                GoogleEventStoreMaanger.sharedStore.googleEventManger.service = nil
                // Serializes authorization to keychain in GTMAppAuth format.
                GTMAppAuthFetcherAuthorization.save(gtmAuthorization, toKeychainForName: kGTMAppAuthKeychainItemName)
                // Callback
                
                //clang diagnostic push
                //clang diagnostic ignored "-Warc-performSelector-leaks"
                //clang diagnostic pop
                completion(true)
            }
            else {
                //                weakSelf.calendarListFetchError = error
                //                weakSelf.updateUI()
                completion(false)
                
            }
        }
        
    }
    
    func logoutUser() -> Void {
        
        let calendarService = self.calendarService()
        GTMAppAuthFetcherAuthorization.removeFromKeychain(forName: kGTMAppAuthKeychainItemName)
        calendarService?.authorizer = nil
        GoogleEventStoreMaanger.sharedStore.googleEventManger.service = nil

    }
    
    // Get a service object with the current username/password
    //
    // A "service" object handles networking tasks.  Service objects
    // contain user authentication information as well as networking
    // state information (such as cookies and the "last modified" date for
    // fetched data.)
    
    func calendarService() -> GTLRCalendarService? {
        if service == nil {
            service = GTLRCalendarService.init()
            // Have the service object set tickets to fetch consecutive pages
            // of the feed so we do not need to manually fetch them
            service?.shouldFetchNextPages = true
            // Have the service object set tickets to retry temporary error conditions
            // automatically
            service?.isRetryEnabled = true
        }
        return service
    }
    
}
