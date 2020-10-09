//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by CSC Student on 10/8/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileimageview: UIImageView!
    
    @IBOutlet weak var usernamelabel: UILabel!
    
    @IBOutlet weak var tweetscontent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
