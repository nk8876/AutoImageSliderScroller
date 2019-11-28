//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Dheeraj Arora on 20/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
    }
    

    
   
}
