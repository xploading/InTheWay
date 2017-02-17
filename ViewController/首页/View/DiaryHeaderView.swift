//
//  DiaryHeaderView.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/22.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class DiaryHeaderView: UIView {
    
    
    var tempModel : TravelNoteModel?


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func creatHeaderView(){
        let imgView = UIImageView(frame: CGRect.init(x: 0, y: self.frame.height-110, width: 60, height: 60))
        
        imgView.sd_setImage(with: URL.init(string: (self.tempModel?.userInfos.avatar_m)!))
        
        imgView.layer.cornerRadius = imgView.frame.width/2
        imgView.clipsToBounds = true
        self.addSubview(imgView)
        
        let nameLb = UILabel(frame: CGRect.init(x: imgView.frame.maxX + 10, y: imgView.frame.origin.y + 20, width: 200, height: 20))
        nameLb.text = tempModel?.userInfos.name
        nameLb.textColor = UIColor.white
        nameLb.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(nameLb)

        
        let titleLb = UILabel(frame: CGRect.init(x: 15, y: imgView.frame.maxY + 10, width: Tools.ScreenW, height: 20))
        titleLb.text = self.tempModel?.name
        titleLb.textColor = UIColor.black
        titleLb.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(titleLb)
        
    }

    
    
    
    
}
