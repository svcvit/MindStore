//
//  MSUITabBarController.swift
//  MindStore
//
//  Created by LiuRon on 2016/12/2.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit

class MSUITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        
        // Do any additional setup after loading the view.
    }
    
    //初始化tabBar
    override class func initialize() {
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor.white
    }
    
    
    func addChildViewControllers() {
        addChildViewController(MSHomeTableViewController(), title: "首页", imageName: "home_tabbar_22x22_", selectedImageName: "home_tabbar_press_22x22_")
        addChildViewController(MSHomeTableViewController(), title: "二页", imageName: "home_tabbar_22x22_", selectedImageName: "home_tabbar_press_22x22_")
        addChildViewController(MSHomeTableViewController(), title: "三页", imageName: "home_tabbar_22x22_", selectedImageName: "home_tabbar_press_22x22_")
        
    }
    
    func addChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        
        let nav = UINavigationController(rootViewController: childController)
        
        nav.title = title
        nav.tabBarItem.image = UIImage(named: imageName)
        nav.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        nav.tabBarItem.title = title

        nav.navigationBar.topItem?.title = title

        addChildViewController(nav)
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
