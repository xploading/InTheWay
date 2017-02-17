//
//  DiaryNetWork.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/16.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class DiaryNetWork: NSObject {

    static func loadDiaryData(strUrl:String,pare:Dictionary<String,String>?,callBack:@escaping (_ DiaryArr:Array<Any>)->Void){
        BasicRequest.GetRequestWithPare(str: strUrl, pare: pare) { (data) in
            
            var dataArr = [DirayModel]()
            
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
            let days = json.value(forKey: "days") as! Array<Any>
            
            for model in days{
                let diaryModel = DirayModel()
                diaryModel.setValuesForKeys(model as! [String : Any])
                dataArr.append(diaryModel)
            }
            callBack(dataArr)
        }
        
        
    }
    
    
    static func loadAutoScrollData(strUrl:String,pare:Dictionary<String,String>?,callBack:@escaping (_ imgUrlArr:Array<Any>,_ nameArr:Array<Any>)->Void){
        
        BasicRequest.GetRequestWithPare(str: ScrollImage, pare: nil) { (data) in
            var imgURLArr = [String]()
            var nameArr = [String]()
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
            let result = json["result"] as! Dictionary<String,Any>
            let themeArr = result["theme_items"] as! Array<Dictionary<String,Any>>
            for dict in themeArr {
                let dic = dict["activity"] as! Dictionary<String,Any>
                let imgUrl = dic["img_url"] as! String
                let name = dic["subname"] as! String
                imgURLArr.append(imgUrl)
                nameArr.append(name)
            }
            callBack(imgURLArr, nameArr)
            
        }
    }

    
    
    
    
}
