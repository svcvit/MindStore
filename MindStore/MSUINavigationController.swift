//
//  MSUINavigationController.swift
//  MindStore
//
//  Created by LiuRon on 2016/12/2.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit

class MSUINavigationController: UINavigationController {


    
    override class func initialize() {
        super.initialize()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.white
        navBar.tintColor = UIColor.white
    }

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    func navigationBack(){
        popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
