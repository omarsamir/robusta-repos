//
//  ServiceManager.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import Foundation

class ServiceManager {
    typealias CompletionHandler = (_ repos: [Repository]?, _ error: Error?) -> Void
    static func downloadRepos(completionHandler:@escaping CompletionHandler) {
        let url = URL(string: Constants.robustaEndPointsServiceURL)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if error == nil {
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode([Repository].self, from: data)
                    completionHandler(result, nil)
                } catch {
                    completionHandler(nil, error)
                }
            } else {
                completionHandler(nil, error)
            }
        }
        task.resume()
    }
    
    static func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
