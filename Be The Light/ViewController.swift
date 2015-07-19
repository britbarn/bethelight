//
//  ViewController.swift
//  Be The Light
//
//  Created by Brittany Barnes on 6/16/15.
//  Copyright (c) 2015 Brittany Barnes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view controller");
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view, typically from a nib.
        }}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

