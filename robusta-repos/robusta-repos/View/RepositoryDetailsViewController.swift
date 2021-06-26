//
//  RepositoryDetailsViewController.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
    @IBOutlet weak var repoAvatar: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var avatar: UIImage?
     var repo: Repository?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
 
    func setupUI() {
        self.repoAvatar.image = avatar
        self.infoLabel.text = "Name: \(repo?.name ?? "")\nOwnerName: \(repo?.owner.login ?? "")\nNodeID: \(repo?.owner.nodeID ?? "")\nType: \(repo?.owner.type.rawValue ?? "")"
    }
}
