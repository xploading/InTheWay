//
//  SpecialNetWork.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/15.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class SpecialNetWork: NSObject {
    
    static func loadSpecialData(strUrl:String,pare:[String:String]?,callBack:@escaping (_ specials:Array<Any>)->Void){
        var specials = [SpecialModel]()
        BasicRequest.GetRequestWithPare(str: strUrl, pare: pare) { (data) in
            let jsonArr = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Array<Dictionary<String,Any>>
            for dict in jsonArr{
                let model = SpecialModel()
                model.setValuesForKeys(dict)
                specials.append(model)
            }
                callBack(specials)
        }

    }
    
    
    //游记
    static func loadTravelNoteData(strUrl:String,pare:[String:String]?,callBack:@escaping (_ TravelNotes:Array<Any>)->Void){
        var travelNotes = [TravelNoteModel]()
        BasicRequest.GetRequestWithPare(str: strUrl, pare: nil) { (data) in
            let jsonDict = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
            
            let tripArr = jsonDict["trips"] as! Array<Dictionary<String,Any>>
            
            for dic in tripArr{
                let model = TravelNoteModel()
                model.setValuesForKeys(dic)
                travelNotes.append(model)
            }
            callBack(travelNotes)
            
        }
        
    }
    

}
