//
//  BasicRequest.swift
//  XPSeeChina
//
//  Created by qianfeng on 2016/12/6.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class BasicRequest: NSObject {
    
    //Get请求
    static func GetRequestWithPare(str:String,pare:[String:String]?,dataBack:@escaping (_ data:Data)->Void){
        var urlStr = str
        if pare != nil{
            let pareStr = BasicRequest.jointPare(pare: pare!)
            urlStr = str + pareStr

        }
        print(urlStr)
        let url = URL(string: urlStr)
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, request, error) in
            DispatchQueue.main.sync {
                if error == nil{
                    dataBack(data!)
                }else{
                    print(error?.localizedDescription as Any)
                }
                
            }
         
        }
        task.resume()

    }
    
    //POST请求
    static func PostRequestWithPare(str:String,pare:[String:String],dataBack:@escaping (_ data:Data)->Void){
        
        let pareStr = BasicRequest.jointPare(pare: pare)
        let urlStr = str+pareStr
        print(urlStr)
        let url = URL(string: urlStr)
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "Post"
        let task = session.dataTask(with: request) { (data, request, error) in
                        
            DispatchQueue.main.sync {
                if error == nil{
                    dataBack(data!)
                }else{
                    print(error?.localizedDescription as Any)
                }
            }
            
        }
        task.resume()
        
    }
    
    
    
    
    
    
    
    //拼接字典
    static func jointPare(pare:Dictionary<String, String>)->String{
        var str = "?"
        for key in pare.keys{
            let s = key + "=" + pare[key]! + "&"
            str += s
        }
        if str.hasSuffix("&"){
            str.remove(at: str.index(before: str.endIndex))
        }
        
        return str
    }
    
    

}
