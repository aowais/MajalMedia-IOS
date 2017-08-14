//
//  NewsCell.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/6/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell{

    @IBOutlet weak var img_news: UIImageView!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_date: UILabel!
    @IBOutlet weak var lbl_views: UILabel!
    @IBOutlet weak var lbl_cat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(item: News){
        lbl_title.text = item.title
        lbl_date.text = item.created_date
        lbl_views.text = item.view_count
        lbl_cat.text = item.page_name
        
        img_news.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        img_news.contentMode = .scaleAspectFill
        img_news.clipsToBounds = true

        let url = URL(string: item.main_img)!
        let image = UIImage(named: "ic_placeholder")
        img_news.kf.setImage(with: url,placeholder: image)
    }

}
