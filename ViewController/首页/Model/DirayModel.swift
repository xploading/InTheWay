//
//  DirayModel.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/16.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class DirayModel: NSObject {
    var points : [Waypoints]?
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "waypoints"{
            self.points = [Waypoints]()
            let valueArr = value as! NSArray
            
            for val in valueArr{
                let model = Waypoints()
                model.setValuesForKeys(val as![String : Any])
                self.points?.append(model)
            }
            
        }
    }
    
    
    
    
    
}

class Waypoints: NSObject {
    var photo_s:String!
    var province:String!
    var recommended:NSNumber!
    var country:String!
    var photo_1600:String!
    var photo_w640:String!
    var city:String!
    var day:NSNumber!
    var local_time:String!
    var track:NSNumber!
    var recommendations:Int!
    var shared:NSNumber!
    var photo_webtrip:String!
    var Id:NSNumber!
    var trip_id:NSNumber!
    var timezone:String!
    var model:String!
    var text:String!
    var comments:NSNumber!
    var photo:String!
    var photo_weblive:String!
    var privacy:NSNumber!
    var device:NSNumber!
    var date_added:NSNumber!
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "id"{
            self.Id = value as! NSNumber
        }
    }

}










