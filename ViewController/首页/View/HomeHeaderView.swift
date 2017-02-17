//
//  HomeHeaderView.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/20.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
    var imgURLArr : [String]?
    var nameArr:[String]?


    override init(frame:CGRect){
        super.init(frame: frame)
        self.loadData(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createAutoScrollView(frame:CGRect){
        let autoView = XTADScrollView(frame: frame)
        autoView.imageURLArray = imgURLArr
        autoView.infiniteLoop = true
        autoView.startAutoCarousel()
        autoView.isAutoCarouseling()
        autoView.detailArray = self.nameArr
        self.addSubview(autoView)
        
        
    }
    
    
    func loadData(frame:CGRect){
        
        BasicRequest.GetRequestWithPare(str: ScrollImage, pare: nil) { (data) in
            self.imgURLArr = [String]()
            self.nameArr = [String]()
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
            let result = json["result"] as! Dictionary<String,Any>
            let themeArr = result["theme_items"] as! Array<Dictionary<String,Any>>
            for dict in themeArr {
                let dic = dict["activity"] as! Dictionary<String,Any>
                let imgUrl = dic["img_url"] as! String
                let name = dic["subname"] as! String
                self.imgURLArr?.append(imgUrl)
                self.nameArr?.append(name)
                
            }
            self.createAutoScrollView(frame: frame)
            
        }
    }
    
    
    
    
    
    
    
    
}
