//
//  TopicTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/4/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit
import TagListView

class TopicTableViewCell: UITableViewCell {

    @IBOutlet weak var numberview: UILabel!
    @IBOutlet weak var taglistview: TagListView!
//    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var TitleTopic: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var DescriptionTopic: UILabel!
    @IBOutlet weak var CountReply: UILabel!
    @IBOutlet weak var roundview: UIView!
    @IBOutlet weak var TagName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        taglistview.delegate = self as! TagListViewDelegate
//        taglistview.addTag("TagListView")
//        taglistview.addTag("TEAChart")
//        taglistview.addTag("To Be Removed")
//        taglistview.addTag("To Be Removed")
        
        
        roundview.backgroundColor = .white


               roundview.layer.shadowColor = UIColor.gray.cgColor

               roundview.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)

               roundview.layer.shadowRadius = 6.0

               roundview.layer.shadowOpacity = 0.7
        
        taglistview.textFont = .systemFont(ofSize: 13)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    override func prepareForReuse() {
//    self.cv.reloadData()
//      }

}
