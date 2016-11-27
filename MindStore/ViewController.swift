//
//  ViewController.swift
//  MindStore
//
//  Created by LiuRon on 2016/11/26.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = MSHomeTableViewController()
        self.addChildViewController(vc)
        self.view.addSubview(vc.view)
        

        MSNetworkTool.shareNetworkTool.loadMinds(look_back_days: 1, finished: {
            out in
            vc.mains = out
            vc.tableView.reloadData()

        })
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

