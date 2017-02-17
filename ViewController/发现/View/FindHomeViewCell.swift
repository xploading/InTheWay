//
//  FindHomeViewCell.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/22.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class FindHomeViewCell: UITableViewCell {

 
    @IBOutlet weak var centreBtn: UIButton!
    @IBOutlet weak var foodBtn: UIButton!
    @IBOutlet weak var hotelBtn: UIButton!
    @IBOutlet weak var shopBtn: UIButton!
    @IBOutlet weak var position: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.centreBtn.layer.cornerRadius = self.centreBtn.frame.width/2
        self.centreBtn.clipsToBounds = true
        self.selectionStyle = .none
        self.layoutButton()
        
        // Configure the view for the selected state
    }
    
    //设置四个按钮
    func layoutButton(){
        self.foodBtn.addTarget(self, action: #selector(footAction), for: .touchUpInside)
        self.hotelBtn.addTarget(self, action: #selector(hotelAction), for: .touchUpInside)
        self.shopBtn.addTarget(self, action: #selector(shopAction), for: .touchUpInside)
        self.position.addTarget(self, action: #selector(positionAction), for: .touchUpInside)
     
    }
    
    func footAction(){
        
    }
    func hotelAction(){
        
    }
    func shopAction(){
        
    }
    func positionAction(){
        
    }
    
    
    
    
    
    
    
}
