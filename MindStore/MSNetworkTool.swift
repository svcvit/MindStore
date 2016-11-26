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
    func loadMinds(look_back_days:Int,finished:()->()){
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
                        var mains = [MSMain]()
                        
                        for dict in data {
                            let main = MSMain(dict: dict as! [String:AnyObject])
                            mains.append(main)
                            print (main.title!)
                        }
                    }
                }
        }
    }
    
}


