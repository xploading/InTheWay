//
//  TravelNoteModel.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/15.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class TravelNoteModel: NSObject {
    var last_day:NSNumber!
    var device:NSNumber!
    var summary:String!
    var Id:NSNumber!
    var cover_image:String!
    var spot_count:NSNumber!
    var cover_image_w640:String!
    var is_hot_trip:NSNumber!
    var first_day:NSNumber!
    var version:NSNumber!
    var cover_image_1600:String!
    var is_featured_trip:NSNumber!
    var mileage:NSNumber!
    var privacy:NSNumber!
    var last_modified:NSNumber!
    var recommended:NSNumber!
    var recommendations:NSNumber!
    var name:String!
    var popular_place_str:String!
    var waypoints:NSNumber!
    var comment_count:NSNumber!
    var date_complete:NSNumber!
    var wifi_sync:NSNumber!
    var date_added:NSNumber!
    var view_count:NSNumber!
    var cover_image_default:String!
    var index_title:String!
    var share_url:String!
    var day_count:NSNumber!
    var userInfos : UserModel!
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        if key == "id"{
            self.Id = value as! NSNumber!
        }
        if key == "user"{
            self.userInfos = UserModel()
            self.userInfos.setValuesForKeys(value as! [String : Any])
            
        }
    }
    
    
    
}
class UserModel :NSObject{
    var birthday:String!
    var location_name:String!
    var is_hunter:NSNumber!
    var custom_url:String!
    var user_desc:String!
    var avatar_s:String!
    var cover:String!
    var name:String!
    var avatar_l:String!
    var cdc2:NSNumber!
    var email_verified:Int!
    var gender:NSNumber!
    var Id:NSNumber!
    var email:String!
    var points:NSNumber!
    var mobile:String!
    var avatar_m:String!
    var resident_city_id:NSNumber!
    

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        if key == "id"{
            self.Id = value as! NSNumber
        }
    }
}


















