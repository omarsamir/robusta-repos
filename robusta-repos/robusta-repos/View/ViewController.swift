//
//  ViewController.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var reposTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reposTableView.delegate = self
        reposTableView.dataSource = self
        reposTableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
        // Do any additional setup after loading the view.
    }
}


extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepoTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell") as? RepoTableViewCell
        return cell
    }
    
    
}
