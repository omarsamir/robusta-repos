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
    
    func fillRepoInfo(repo: Repository){
        self.repositoryName.text = repo.name
        self.repositoryOwnerName.text = repo.owner.login
        self.downloadImage(from: repo.owner.avatarURL)
    }
    
    func downloadImage(from stringURL: String) {
        guard let url = URL(string: stringURL) else {return}
        ServiceManager.getImageData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.repoAvatar.image = UIImage(data: data)
            }
        }
    }
    
}
