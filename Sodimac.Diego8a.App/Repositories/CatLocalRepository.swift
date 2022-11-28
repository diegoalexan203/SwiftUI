//
//  CatLocalRepository.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 25/11/22.
//

import Foundation

class CatLocalRepository: CatLocalRepositoryProtocol {
    func deleteFavoriteCatCategory(catCategory: CatCategory, onSuccess: (Bool) -> Void, onFailure: (Error) -> Void) {
        do{
            let rowDeleted = try ManagerDB().deleteCatCategory(catCategory: catCategory)
            onSuccess(rowDeleted > 0)
        }catch let error as NSError{
            onFailure(error)
        }
    }
    
    func saveFavoriteCatCategory(category: CatCategory, onSuccess: (Bool) -> Void, onFailure: (Error) -> Void) {
        do{
            try ManagerDB().create(catCategory: category)
            onSuccess(true)
        }catch let error as NSError{
            onFailure(error)
        }
    }
}
