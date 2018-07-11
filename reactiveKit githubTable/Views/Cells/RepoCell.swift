//
//  RepoCell.swift
//  reactiveKit githubTable
//
//  Created by Abdulmajeed khalid on 11/07/2018.
//  Copyright © 2018 Abdulmajeed khalid. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoOwnerLabel: UILabel!
    @IBOutlet weak var repoStarsCountLabel: UILabel!
    @IBOutlet weak var repoDiscriptionLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
