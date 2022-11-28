//
//  CatApiRepositoryProtocol.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 24/11/22.
//

import Foundation

protocol CatApiRepositoryProtocol {
    func getCatCategories(completion: @escaping([CatCategory])->())
}
