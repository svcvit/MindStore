//
//  MSMains.swift
//  MindStore
//
//  Created by LiuRon on 2016/11/26.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import Foundation

class Mains: NSObject,NSCoding{
    
    var title:String?
    var thumb_image:String?
    var tagline:String?
    var id:Int?
    var created_at:Int?
    var vote_count:Int?
    var link:String?
    
    //以keyValue形式对基本数据类型Encoding
    init(dict:[String:AnyObject]) {
        super.init()
        title = dict["title"] as? String
        thumb_image = dict["thumb_image"] as? String
        tagline = dict["tagline"] as? String
        id = dict["id"] as? Int
        created_at = dict["created_at"] as? Int
        vote_count = dict["vote_count"] as? Int
        link = dict["link"] as? String
    }
    
    //以keyValue形式对基本数据类型Decoding
    required init?(coder aDecoder:NSCoder) {
        super.init()
        title = aDecoder.decodeObject(forKey: "title") as? String
        thumb_image = aDecoder.decodeObject(forKey: "thumb_image") as? String
        tagline = aDecoder.decodeObject(forKey: "tagline") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        created_at = aDecoder.decodeObject(forKey: "created_at") as? Int
        vote_count = aDecoder.decodeObject(forKey: "vote_count") as? Int
        link = aDecoder.decodeObject(forKey: "link") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(thumb_image, forKey: "thumb_image")
        aCoder.encode(tagline, forKey: "tagline")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(created_at, forKey: "created_at")
        aCoder.encode(vote_count, forKey: "vote_count")
        aCoder.encode(link, forKey: "link")
    }
}
