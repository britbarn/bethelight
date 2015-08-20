//
//  ViewController.swift
//  Be The Light
//
//  Created by Brittany Barnes on 6/16/15.
//  Copyright (c) 2015 Brittany Barnes. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
   
    @IBOutlet var menuButton: UIBarButtonItem!
    
    @IBOutlet var webView: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil
        {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        
        let url2  =  "http://livestream.com/hctvfour/"
        let requestURL = NSURL(string:url2)
        let request2 = NSURLRequest(URL: requestURL!)
        self.webView.loadRequest(request2)
        self.webView.scalesPageToFit = true;
        
        
        
        
        var url : String = "http://xproshowcasex.api.channel.livestream.com/2.0/livestatus.json"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            print(jsonResult);
            let channel: NSDictionary! = jsonResult.valueForKey("channel") as! NSDictionary;
            print(channel);
            let result: NSNumber! = channel.valueForKey("isLive") as! NSNumber;
            print(result);
            
            if (result == 0)
            {
                let alertController = UIAlertController(title: "", message:
                    "There is no live stream right now", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
            })
            
            
                
            
            
        
            
            
            
       
       
        
        }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

