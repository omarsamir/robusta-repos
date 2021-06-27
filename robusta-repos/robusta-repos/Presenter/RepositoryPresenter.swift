//
//  RepositoryPresenter.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import Foundation

protocol RepositoryViewControllerDelegate : class {
    func reloadRepositoriesTableView(repos: [Repository]?)
    func presentError()
    func startLoading()
    func finishLoading()
}
class RepositoryPresenter {
    weak var repositoryViewController: RepositoryViewControllerDelegate?
    
    init(view: RepositoryViewControllerDelegate) {
        self.repositoryViewController = view
        loadRepositories()
    }
    
    func loadRepositories(serviceManager: ServiceManager.Type? = ServiceManager.self ){
        self.repositoryViewController?.startLoading()
        serviceManager?.downloadRepos { [weak self] (repos, error) in
            if repos != nil {
                self?.repositoryViewController?.reloadRepositoriesTableView(repos: repos ?? [Repository]())
            } else {
                self?.repositoryViewController?.presentError()
            }
            self?.repositoryViewController?.finishLoading()
        }
    }
}
