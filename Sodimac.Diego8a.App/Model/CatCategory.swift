//
//  CatCategory.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 23/11/22.
//

import Foundation

struct CatCategory: Codable, Identifiable {
    let id, name: String
  
    let catCategoryDescription, lifeSpan: String?
    let wikipediaURL: String?
    let image: CatImage?
   
    var favorite: Bool?
    var date : Date?

    enum CodingKeys: String, CodingKey {
        case id, name
        case catCategoryDescription = "description"
        case lifeSpan = "life_span"
        case wikipediaURL = "wikipedia_url"
        case image
        case favorite
        case date
    }
}
