//
//  RepositoryPresenter.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import Foundation

protocol RepositoryViewControllerDelegate : class {
    func reloadRepositoriesTableView(repos: [Repository]?)
    func presentError(error: Error?)
    func startLoading()
    func finishLoading()
}
class RepositoryPresenter {
    weak var repositoryViewController: RepositoryViewControllerDelegate?
    
    init(view: RepositoryViewControllerDelegate) {
        self.repositoryViewController = view
        loadRepositories()
    }
    
    func loadRepositories(){
        self.repositoryViewController?.startLoading()
        ServiceManager.downloadRepos { [weak self] (repos, error) in
            if repos != nil && error == nil {
                self?.repositoryViewController?.reloadRepositoriesTableView(repos: repos ?? [Repository]())
            } else {
                self?.repositoryViewController?.presentError(error: error)
            }
            self?.repositoryViewController?.finishLoading()
        }
    }
}
