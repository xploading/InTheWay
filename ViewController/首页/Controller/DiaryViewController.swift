//
//  DiaryViewController.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/16.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class DiaryViewController: BasicViewController {
    
    //头视图的背景图
    var headerImgView : UIImageView?
    
    var tempW : CGFloat?
    var tempH : CGFloat?
    
    var tempModel : TravelNoteModel?

    
    
    var diarySource = [DirayModel]()
    var lastUrl:String?
    //如果不存在图片,则使用此临时图片代替.
    var tempImgUrl :String?

    var diaryTabView : UITableView?
    
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.view.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)

        
        self.layoutUI()
        
        self.loadData()
        
        self.createBackImage()
    }
    
    //获取数据
    func loadData(){
        let urlStr = NSString(format: KURLDETAILE as String as NSString, self.lastUrl!) as String
        DiaryNetWork.loadDiaryData(strUrl: urlStr, pare: nil) { (array) in
            for model in array{
                self.diarySource.append(model as! DirayModel)
                
            }
            //添加头视图
            self.diaryTabView?.tableHeaderView = self.createTabHeaderView()
            //添加头视图的背景
            
            self.view.addSubview(self.headerImgView!)
            self.view.addSubview(self.diaryTabView!)

            
            
            
            self.diaryTabView?.reloadData()
        }
    }
    
    //布局界面
    func layoutUI(){
        
        
        self.diaryTabView = UITableView(frame: CGRect.init(x: 0, y: 64, width: Tools.ScreenW, height: Tools.ScreenH - 64 - 44), style: .grouped)
        diaryTabView?.delegate = self
        diaryTabView?.dataSource = self
        diaryTabView?.estimatedRowHeight = 44
    
        self.diaryTabView?.backgroundColor = UIColor.clear
        let nib = UINib(nibName: "DiaryCell", bundle: nil)
        self.diaryTabView?.register(nib, forCellReuseIdentifier: "DiaryCell")
    }
    
    //创建头视图
    func createTabHeaderView() ->UIView{
        let headerView = DiaryHeaderView(frame: CGRect.init(x: 0, y: 0, width: Tools.ScreenW, height: 260))
        headerView.backgroundColor = UIColor.clear
        
        
        headerView.tempModel = self.tempModel
        headerView.creatHeaderView()
        return headerView
    }
    
    //头视图的背景图
    func createBackImage(){
        headerImgView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: Tools.ScreenW, height: 264))
        self.tempW = headerImgView?.frame.width
        self.tempH = headerImgView?.frame.height
        headerImgView?.sd_setImage(with: URL.init(string: self.tempImgUrl!))
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension DiaryViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return diarySource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = diarySource[section].points
        return arr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as! DiaryCell
        let models = self.diarySource[indexPath.section]
        let model = models.points?[indexPath.row]
        if model?.photo == ""{
            model?.photo = self.tempImgUrl
        }
        cell.model = model!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let models = self.diarySource[indexPath.section]
        let model = models.points?[indexPath.row]
        
        var height = CGFloat(10 + 20 + 5 + 150 + 5 + 30 + 20) + 50
        if model?.text == ""{
            height = height - 50
        }
        
        return height
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let lb = UILabel(frame: CGRect.init(x: 0, y: 0, width: Tools.ScreenW, height: 50))
        lb.text = "行程第\(section+1)天"
        lb.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.7)
        lb.textColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)

        lb.textAlignment = .right
        return lb
    }
    
    
    
    
    
    //变长变大
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentY = scrollView.contentOffset.y
        if contentY < 0{
            var rect = scrollView.frame
            rect.size.height = tempH! - contentY
            rect.size.width = tempW! - contentY
            rect.origin.x = -(rect.size.width-tempW!)/2
            rect.origin.y = 0
            self.headerImgView?.frame = rect
        }else{
            var rect = scrollView.frame
            rect.size.height = tempH!
            rect.size.width = tempW!
            rect.origin.x = 0
            rect.origin.y = -contentY
            self.headerImgView?.frame = rect
        }
    }

    
    
    
}



