//
//  TweetViewController.swift
//  Be The Light
//
//  Created by Brittany Barnes on 8/19/15.
//  Copyright (c) 2015 Brittany Barnes. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

class TweetViewController:

TWTRTimelineViewController {
    
    @IBOutlet var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if self.revealViewController() != nil
    {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
        
       TWTRTweetView.appearance().theme = .Dark
    
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if let validSession = session {
                let client = Twitter.sharedInstance().APIClient
                self.dataSource = TWTRUserTimelineDataSource(screenName: "britbarnes92", APIClient: client)
            } else {
                println("error: \(error.localizedDescription)")
                 }
            
        }
    

    }
    
    
}
