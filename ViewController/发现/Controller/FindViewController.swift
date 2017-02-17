//
//  FindViewController.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/14.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class FindViewController: BasicViewController {
    
    
    var findTabView : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "发现身边最好的自己"
        self.layoutFindTabView()

        
    }
    
    //布局tableView
    func layoutFindTabView(){
        findTabView = UITableView(frame: CGRect.init(x: 0, y: 0, width: Tools.ScreenW, height: Tools.ScreenH-64-44))
        
        let nib = UINib(nibName: "FindHomeViewCell", bundle: nil)
        findTabView?.register(nib, forCellReuseIdentifier: "FindHomeViewCell")
        
        findTabView?.delegate = self
        findTabView?.dataSource = self
        
        
        self.view.addSubview(findTabView!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}

extension FindViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindHomeViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
    
}







