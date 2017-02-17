//
//  DiaryCell.swift
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/20.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

import UIKit

class DiaryCell: UITableViewCell {
    @IBOutlet weak var postionLb: UILabel!
    @IBOutlet weak var timeLb: UILabel!

    @IBOutlet weak var showImg: UIImageView!
    
    @IBOutlet weak var contentLb: UILabel!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var posImg: UIImageView!
    
    
    
    
    var model = Waypoints(){
        didSet{
            
            self.postionLb.text = "\(model.country!)    \(model.city!)"
            self.timeLb.text = model.local_time!
            self.showImg.sd_setImage(with: URL.init(string: (model.photo)!))
            self.contentLb.text = model.text

        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "backImg1.jpg")!)
        self.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)

        self.showImg.layer.cornerRadius = 5
        self.timeLb.layer.cornerRadius = 3
        self.backView.layer.cornerRadius = 5
        
        self.showImg.clipsToBounds = true
        self.timeLb.clipsToBounds = true
        self.backView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
