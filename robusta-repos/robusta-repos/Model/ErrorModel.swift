//
//  ErrorModel.swift
//  robusta-repos
//
//  Created by omar on 26/06/2021.
//

import Foundation

// MARK: - Welcome
class ErrorModel: Codable {
    let message: String
    let documentationURL: String

    enum CodingKeys: String, CodingKey {
        case message
        case documentationURL = "documentation_url"
    }

    init(message: String, documentationURL: String) {
        self.message = message
        self.documentationURL = documentationURL
    }
}
