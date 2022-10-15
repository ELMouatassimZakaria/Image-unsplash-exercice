//
//  Results.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import Foundation

struct Results: Codable {
    var total: Int
    var results: [Result]
}

struct Result: Codable {
    let id: String
    let createdDate: String?
    let urls : URLs
    let description: String?
}

struct URLs: Codable {
    var full: String
    var raw: String
    var thumb: String
    var small : String
    var regular: String
}
