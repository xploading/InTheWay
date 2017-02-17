//
//  TravelNoteTableCell.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/15.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class TravelNoteTableCell: UITableViewCell {

    @IBOutlet weak var headerImg: UIImageView!
    
    @IBOutlet weak var nameLb: UILabel!
    
    @IBOutlet weak var backImg: UIImageView!
    
    @IBOutlet weak var titleLb: UILabel!
    
    @IBOutlet weak var dateLb: UILabel!
    
    

    var model :TravelNoteModel = TravelNoteModel(){
        didSet{
            self.headerImg.sd_setImage(with: URL.init(string: model.userInfos.avatar_m))
            self.nameLb.text = model.userInfos.name
            self.backImg.sd_setImage(with: URL.init(string: model.cover_image_w640))
            self.titleLb.text = model.name
            let date = "\(model.last_day!)"
            
            var str = XPGetTime.timeStampToString(timeStamp: date)
            
            str = model.popular_place_str + "     " + str
            self.dateLb.text = str
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.headerImg.layer.cornerRadius = self.headerImg.frame.size.width/2
        self.headerImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
