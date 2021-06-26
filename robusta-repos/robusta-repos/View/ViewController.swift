//
//  ViewController.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var reposTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    private var repos: [Repository]? = nil
    private var presenter: RepositoryPresenter? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        reposTableView.delegate = self
        reposTableView.dataSource = self
        reposTableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
        presenter = RepositoryPresenter(view: self)
        // Do any additional setup after loading the view.
    }
}


extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepoTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell") as? RepoTableViewCell
        guard let repoObject = self.repos?[indexPath.row] else {return UITableViewCell()}
        cell.fillRepoInfo(repo: repoObject)
        return cell
    }
}

extension ViewController: RepositoryViewControllerDelegate {
    func reloadRepositoriesTableView(repos: [Repository]?){
        self.repos = repos
        DispatchQueue.main.async {
            self.reposTableView.reloadData()
        }
    }
    
    func presentError(error: Error?) {
        
    }
    
    func startLoading() {
        self.loadingIndicator.isHidden = false
    }
    
    func finishLoading() {
        self.loadingIndicator.isHidden = true
    }
    
    
}
