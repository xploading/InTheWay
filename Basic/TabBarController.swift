//
//  TabBarController.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/14.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createTabBarController()
    }
    
    //通过工程名.类名创建带导航栏的标签控制器
    func createTabBarController(){
        
        var tabViews = [UINavigationController]()
        let subNames = ["HomePageViewController","GuideViewController","FindViewController","MineViewController"]
        let titles = ["首页","指南","发现","我的"]
        let imageNames = ["home","compass","find","user"]
        
        for i in 0..<subNames.count{
            let projectStr = "XPInTheWay."
            let className = projectStr + subNames[i]
            let classType = NSClassFromString(className) as! UIViewController.Type
            let vc = classType.init()
            
            vc.tabBarItem = UITabBarItem(title:titles[i] , image: UIImage.init(named: imageNames[i])?.withRenderingMode(.alwaysOriginal), tag: 1)
            let nvc = UINavigationController(rootViewController: vc)
            
            tabViews.append(nvc)
        }
        self.viewControllers = tabViews
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
