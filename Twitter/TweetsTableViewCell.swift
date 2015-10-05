//
//  TweetsTableViewCell.swift
//  Twitter
//
//  Created by Sudipta Bhowmik on 10/2/15.
//  Copyright © 2015 Sudipta Bhowmik. All rights reserved.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var onReply: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
 
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
 
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
  
    var id: Int?
    
    
    var tweet: Tweet? {
        willSet(value) {
            
        self.profileImageView.setImageWithURL(value?.user.profileImageUrl)
            //print("IMG URL \(value?.user.profileImageUrl)")
            self.nameLabel.text = value?.user.name
            self.screenNameLabel.text = "@\(value!.user.screenname)"
            self.tweetText.text = value?.text
            self.id = (value?.id)!
            //print("Tweet id: \(self.id)")
            //print("Status: \(self.tweetText.text)")
            self.timeLabel.text = value?.createdAt.timeAgo()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 3
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
  
    @IBAction func onRetweet(sender: AnyObject) {
        print("Retweet clicked")
        TwitterClient.sharedInstance.postRetweetWithParams(self.id!, params: nil, completion: {(error) -> () in
            self.retweetButton.imageView?.image = UIImage(named: "retweet_on")
            
        })
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        print("Favorite clicked")
        TwitterClient.sharedInstance.postFavoriteWithParams(self.id!, params: nil, completion: {(error) -> () in
            self.favoriteButton.imageView?.image = UIImage(named: "favorite_on")
            
        })
        
    }

    @IBAction func onReply(sender: AnyObject) {
        
        
    }
}
