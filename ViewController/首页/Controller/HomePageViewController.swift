//
//  HomePageViewController.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/20.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class HomePageViewController: BasicViewController {
    
    @IBOutlet weak var tabView: UITableView!
    var page = 0
    var travelNotes = [TravelNoteModel]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "游记"
        self.layoutTableView()
        self.refrashUp()
        self.loadData()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //布局tableView
    func layoutTableView(){
        tabView.delegate = self
        tabView.dataSource = self
        let nib = UINib(nibName: "TravelNoteTableCell", bundle: nil)
        tabView.register(nib, forCellReuseIdentifier: "TravelNoteTableCell")
    
        tabView.separatorStyle = .singleLineEtched
        let headView = HomeHeaderView(frame: CGRect.init(x: 0, y: 0, width: Tools.ScreenW, height: 200))
        tabView.tableHeaderView = headView
        tabView.backgroundColor = UIColor.init(patternImage: UIImage(named: "zbackImg.jpg")!)
        
        
    }
    
    
    
    func refrashUp(){
        self.tabView.footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.page += 1
            self.loadData()
        })
        
    }
    //请求数据
    func loadData(){
        
        let url = NSString.init(format: KURLHOT as NSString, self.page) as String
        SpecialNetWork.loadTravelNoteData(strUrl: url, pare: nil) { (array) in
            for elm in array{
                self.travelNotes.append(elm as! TravelNoteModel)
            }
            self.tabView.footer.endRefreshing()
            self.tabView.reloadData()
            
        }
        
    }
    
}

extension HomePageViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.travelNotes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelNoteTableCell", for: indexPath) as! TravelNoteTableCell
        let model = self.travelNotes[indexPath.row]
        cell.model = model
        //        print(model.last_day)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
        
    }
    
    
    //选中跳出下一级界面
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.travelNotes[indexPath.row]
        let diartVc = DiaryViewController()
        diartVc.tempImgUrl = model.cover_image_default
        print(model.cover_image_default)
        diartVc.lastUrl = "\(self.travelNotes[indexPath.row].Id!)/"
        
        diartVc.tempModel = model
        self.navigationController?.pushViewController(diartVc, animated: true)
        
    }
    
    
    
}
