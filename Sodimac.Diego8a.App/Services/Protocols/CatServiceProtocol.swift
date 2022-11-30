//
//  CatServiceProtocol.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 24/11/22.
//

import Foundation
protocol CatServiceProtocol {
    func getCatCategories(completion: @escaping([CatCategory])->())
    
    func getLocalCatCategories(completion: @escaping ([CatCategory]) -> ())
    
    func saveFavoriteCatCategory(category: CatCategory, onSuccess: (Bool) -> Void,
                                 onFailure:(Error) -> Void)
    
    func deleteFavoriteCatCategory(catCategory: CatCategory, onSuccess: (Bool) -> Void,
                                 onFailure:(Error) -> Void)
    
    func getCatCategoryById(idCategory: String, onSuccess: (CatCategory?) -> Void, onFailure: (Error) -> Void)
}
