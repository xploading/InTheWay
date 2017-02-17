//
//  AmbitusViewController.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/23.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class AmbitusViewController: BasicViewController {
    //搜索的关键字
    var keyword:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //配置地图搜索
    func searchMapWithKeyword(){
        let searchApi = AMapSearchAPI()
        searchApi?.delegate = self
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//地图搜索的协议方法
extension AmbitusViewController:AMapSearchDelegate{
    
}






