//
//  NSString+Extension.swift
//  SwiftTest
//
//  Created by LiuRon on 2016/10/18.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import Foundation
import UIKit


extension NSString {
    /// 返回文字的高度
    class func boundingRectWithString(string: NSString, size: CGSize, fontSize: CGFloat) -> CGFloat {
        return string.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)], context: nil).size.height
    }
    
    // 处理http
    class func https(string:String)->String {
        return string.replacingOccurrences(of: "http", with: "https")
    }
    
}
