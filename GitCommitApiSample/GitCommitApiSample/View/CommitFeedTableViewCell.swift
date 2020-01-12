//
//  CommitFeedTableViewCell.swift
//  GitCommitApiSample
//
//  Created by Mohit on 12/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import UIKit

class CommitFeedTableViewCell: UITableViewCell {
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblCommitKey: UILabel!
    @IBOutlet weak var lblCommitMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(commitFeed: CommitData) {
        lblCommitKey.text = commitFeed.hashKey
        lblAuthorName.text = commitFeed.commit.author.name
        lblCommitMessage.text = commitFeed.commit.message
    }
}
