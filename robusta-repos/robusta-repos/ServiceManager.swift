//
//  ServiceManager.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import Foundation

class ServiceManager {
    typealias CompletionHandler = (_ success:Bool) -> Void
    static func downloadRepos(completionHandler: CompletionHandler) {
        let url = URL(string: Constants.robustaEndPointsServiceURL)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
        completionHandler(true)
    }
}
