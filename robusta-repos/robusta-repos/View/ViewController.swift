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
    private var filteredRepos: [Repository]? = nil
    private var presenter: RepositoryPresenter? = nil
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        reposTableView.delegate = self
        reposTableView.dataSource = self
        searchBar.delegate = self
        reposTableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
        presenter = RepositoryPresenter(view: self)
        // Do any additional setup after loading the view.
    }
}


extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.filteredRepos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepoTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell") as? RepoTableViewCell
        guard let repoObject =  self.filteredRepos?[indexPath.row] else {return UITableViewCell()}
        cell.fillRepoInfo(repo: repoObject)
        return cell
    }
}

extension ViewController: RepositoryViewControllerDelegate {
    func reloadRepositoriesTableView(repos: [Repository]?){
        self.repos = repos
        self.filteredRepos = self.repos
        DispatchQueue.main.async {
            self.reposTableView.reloadData()
        }
    }
    
    func presentError(error: Error?) {
        
    }
    
    func startLoading() {
        self.loadingIndicator.isHidden = false
        self.reposTableView.isHidden = true
    }
    
    func finishLoading() {
        DispatchQueue.main.async {
            self.loadingIndicator.isHidden = true
            self.reposTableView.isHidden = false
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRepos = searchText.isEmpty ? repos : repos?.filter { (item: Repository) -> Bool in
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
               }
        self.reposTableView.reloadData()
    }
}
