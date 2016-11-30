//
//  MSNetworkTool.swift
//  MindStore
//
//  Created by LiuRon on 2016/11/26.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MJRefresh
import SVProgressHUD


class MSNetworkTool:NSObject {
    
    static let shareNetworkTool = MSNetworkTool()
    //加载Minds数据 http://mindstore.io/api/v3/lime/mind/?look_back_days=0
    func loadMinds2(look_back_days:Int,finished:@escaping (_ mains:[MSmain])->()){
        let url = BASE_URL + "/lime/mind/?"
        let params = ["look_back_days":look_back_days] as [String:Any]
        Alamofire
            .request(url, method: .get, parameters: params)
            .responseJSON{response in
                guard response.result.isSuccess else {
                    SVProgressHUD.showError(withStatus: "加载失败...")
                    return
                }
                
                if let value = response.result.value {
                    let json = JSON(value)
                    if let data = json["objects"].arrayObject {
                        var mains = [MSmain]()
                        
                        for dict in data {
                            let main = MSmain(dict: dict as! [String:AnyObject])
                            mains.append(main)
                            
                        }
                        
                        finished(mains)
                    }
                }
        }
    }
    
    
    //下拉刷新
    func loadMinds(tableView:UITableView,look_back_days:Int,finished:@escaping (_ mains:[MSmain])->()){
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock:{

            let url = BASE_URL + "/lime/mind/?"
            let params = ["look_back_days":look_back_days] as [String:Any]
            Alamofire
                .request(url, method: .get, parameters: params)
                .responseJSON{response in
                    tableView.mj_header.endRefreshing()
                    guard response.result.isSuccess else {
                        SVProgressHUD.showError(withStatus: "加载失败...")
                        return
                    }
                    
                    if let value = response.result.value {
                        let json = JSON(value)
                        if let data = json["objects"].arrayObject {
                            var mains = [MSmain]()
                            
                            for dict in data {
                                let main = MSmain(dict: dict as! [String:AnyObject])
                                mains.append(main)
                            }
                            finished(mains)
                        }
                    }
            }
        })
        
        tableView.mj_header.isAutomaticallyChangeAlpha = true   //根据拖拽比例自动切换透
        tableView.mj_header.beginRefreshing()
        
    }
    
    
    //上拉加在更多
    func loadMindsMore(tableView:UITableView,look_back_days:Int,finished:@escaping (_ mains:[MSmain])->()){
        
        var days = look_back_days
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock:{
            
            days += 1
            let url = BASE_URL + "/lime/mind/?"
            let params = ["look_back_days":days] as [String:Any]
            

            Alamofire
                .request(url, method: .get, parameters: params)
                .responseJSON{response in
                    
                    tableView.mj_footer.endRefreshing()
                    
                    
                    guard response.result.isSuccess else {
                        SVProgressHUD.showError(withStatus: "加载失败...")
                        return
                    }
                    
                    if let value = response.result.value {
                        let json = JSON(value)
                        if let data = json["objects"].arrayObject {
                            var mains = [MSmain]()
                            
                            for dict in data {
                                let main = MSmain(dict: dict as! [String:AnyObject])
                                mains.append(main)
                                
                            }
                            
                            finished(mains)
                        }
                    }
            }
        
        
        })
        
    }
    
    
    
}


