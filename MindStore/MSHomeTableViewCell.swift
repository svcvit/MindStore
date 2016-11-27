//
//  MSHomeTableViewCell.swift
//  MindStore
//
//  Created by LiuRon on 2016/11/26.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class MSHomeTableViewCell: UITableViewCell {
    
    var main:MSmain? {
        didSet {
            title.text = main!.title!
            tagline.text = main!.tagline!
            thumb_image.kf.setImage(with: URL(string:NSString.https(string: main!.thumb_image!.link!)))
            
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){

        addSubview(thumb_image)
        addSubview(title)
        addSubview(tagline)
        
        thumb_image.snp.makeConstraints{make in
            make.width.height.equalTo(90)
            make.left.top.equalTo(self).offset(5)
            
        }
        
        title.snp.makeConstraints{make in
            make.left.equalTo(thumb_image.snp.right).offset(5)
            make.top.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-5)
        }
        
        tagline.snp.makeConstraints{make in
            make.left.equalTo(thumb_image.snp.right).offset(5)
            make.top.equalTo(title.snp.bottom)
            make.right.equalTo(self).offset(-5)
            
        }
        
    }
    
    
    
    lazy var thumb_image:UIImageView = {
        var thumb_image = UIImageView()
        thumb_image.contentMode = .scaleAspectFill
        thumb_image.backgroundColor = UIColor.lightGray
        return thumb_image
    }()
    
    
    lazy var title:UILabel = {
        var title = UILabel()
        title.font = UIFont.systemFont(ofSize: 17)
        title.numberOfLines = 0
        return title
    }()
    
    lazy var tagline:UILabel = {
        var tagline = UILabel()
        tagline.font = UIFont.systemFont(ofSize: 12)
        tagline.textColor = UIColor.lightGray
        tagline.numberOfLines = 0
        return tagline
    }()


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
