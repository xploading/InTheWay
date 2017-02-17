//
//  XPGetTime.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/15.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

 class XPGetTime: NSObject {
/**
     通过时间戳计算年月日
 */
    static func timeStampToString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        let date = NSDate(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date as Date)
    }
    /**
     通过年月日计算时间戳
     */
    static func stringToTimeStamp(stringTime:String)->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        let date = dfmatter.date(from: stringTime)
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        
        let dateSt:Int = Int(dateStamp)
//        print(dateSt)
        return String(dateSt)
        
    }
    

}
