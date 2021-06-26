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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repoDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "RepositoryDetailsViewController") as! RepositoryDetailsViewController
        var image: UIImage? = nil
        if let cell = tableView.cellForRow(at: indexPath) as? RepoTableViewCell {
            image = cell.repoAvatar.image
        }
        repoDetailsViewController.avatar = image
        repoDetailsViewController.repo = filteredRepos?[indexPath.row]
        self.present(repoDetailsViewController, animated: true, completion: nil)
    }
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
    
    func presentError() {
        DispatchQueue.main.async() { [weak self] in
            let alert = UIAlertController(title: "Oppsss", message: "Somthing wrong happened", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { action in
                switch action.style{
                case .default:
                    self?.presenter?.loadRepositories()
                @unknown default:
                    print("Default")
                }
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
                switch action.style{
                case .destructive:
                    alert.dismiss(animated: true, completion: nil)
                @unknown default:
                    print("Default")
                }
            }))
            self?.present(alert, animated: true, completion: nil)
        }
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
