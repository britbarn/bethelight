//
//  FrontPage.swift
//  Be The Light
//
//  Created by Brittany Barnes on 6/16/15.
//  Copyright (c) 2015 Brittany Barnes. All rights reserved.
//

import Foundation
import UIKit
class FrontPage:UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            // Uncomment to change the width of menu
            //self.revealViewController().rearViewRevealWidth = 62
        }

    /*
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
        super.viewWillAppear(animated)
   
    }
        */}}


