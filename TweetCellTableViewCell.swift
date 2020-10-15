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
    
    
  
    

    @IBOutlet weak var reTweetbutton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    
  
        var favorited:Bool = false
        var tweetId: Int = -1
  
override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
}
        func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
            if (favorited) {
                favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            }
            else {
                favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            }
        
    }
    
    @IBAction func reTweetbutton(_ sender: Any) {
          TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {self.setRetweeted(true)
          }, failure: { (error) in
              print("Error is retweeting: \(error)")
          })
      }
    
    func setRetweeted(_ isRetweeted: Bool){
        if (isRetweeted){
            reTweetbutton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            reTweetbutton.isEnabled = false
            
        } else {
            reTweetbutton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            reTweetbutton.isEnabled = true
    }
    }
    @IBAction func favButton(_ sender: Any) {
        
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {self.setFavorite(true)},
        failure: { (error) in print("Favorite did not execute: \(error)")
                                                    
            
        })
    } else {
        TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {self.setFavorite(false) }, failure: { (error) in
            print("UnFavorit did not execute: \(error)")
        })
        
    }
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
