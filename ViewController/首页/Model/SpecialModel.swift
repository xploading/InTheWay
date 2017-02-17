//
//  SpecialModel.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/15.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class SpecialModel: NSObject {
    var Id:Int!
    var title:String!
    var image_url:String!
    var name:String!
    var updated_at:Int!

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "id"{
            self.Id = value as! Int
        }
    }
    
    
}
