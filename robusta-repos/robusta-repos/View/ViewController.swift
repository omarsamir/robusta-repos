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
        // Do any additional setup after loading the view.
    }
}


extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
