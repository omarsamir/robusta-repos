//
//  RepoTableViewCell.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var repositoryOwnerName: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    @IBOutlet weak var repoAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
