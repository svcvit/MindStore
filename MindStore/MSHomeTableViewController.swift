//
//  MSHomeTableViewController.swift
//  MindStore
//
//  Created by LiuRon on 2016/11/26.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit
import SnapKit

let MSHomeTableViewCellID = "MSHomeTableViewCell"

class MSHomeTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var mains = [MSmain]()
    var days:Int = 0
    
    var tableView:UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        hildTableViewExtraCellLineHidden(tableView: self.tableView)
        self.view.addSubview(tableView)
        setupUI()
        // 添加上拉刷新和下拉刷新
        setupRefresh()
    }
    
    
    //隐藏空白加载的分割符
    func hildTableViewExtraCellLineHidden(tableView : UITableView){
        let view = UIView()
        view.backgroundColor = UIColor.clear
        tableView.tableFooterView = view
        tableView.tableHeaderView = view
    }
    
    private func setupUI(){
        self.definesPresentationContext = true
        tableView.register(MSHomeTableViewCell.self, forCellReuseIdentifier: MSHomeTableViewCellID)
        
        tableView.snp.makeConstraints{make in
            make.height.equalTo(UIScreen.main.bounds.height)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        
        
    }
    
    private func setupRefresh(){
        MSNetworkTool.shareNetworkTool.loadMinds(tableView: self.tableView,look_back_days: self.days, finished: {out in
            self.mains = out
            self.tableView.reloadData()
        })
        
        MSNetworkTool.shareNetworkTool.loadMindsMore(tableView: self.tableView, look_back_days: self.days, finished:{out in
            self.mains += out
            self.tableView.reloadData()
        })
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.mains.count
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let main = self.mains[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MSHomeTableViewCellID, for: indexPath) as! MSHomeTableViewCell
        
        cell.main = main
        
        // Configure the cell...
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let url = URL(string:self.mains[indexPath.row].link!) {
//            UIApplication.shared.open(url)
//        }
        let pop = popViewController()
        
        navigationController?.pushViewController(pop, animated: true)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
