//
//  ViewController.swift
//  MindStore
//
//  Created by LiuRon on 2016/11/26.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let vc = MSHomeTableViewController()
//        self.addChildViewController(vc)
//        self.view.addSubview(vc.view)
//    
//        
        
        
        let test = MSUITabBarController()
        navigationController?.addChildViewController(test)
//        navigationController?.view.addSubview(test.view)
//        self.view.addSubview(test.view)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

