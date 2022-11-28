//
//  CatService.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 24/11/22.
//

import Foundation
class CatService: CatServiceProtocol{
    
    var catRepository: CatApiRepositoryProtocol
    
    var catLocalRepository: CatLocalRepositoryProtocol
    
    init(catRepository: CatApiRepositoryProtocol, catLocalRepository: CatLocalRepositoryProtocol) {
        self.catRepository = catRepository
        self.catLocalRepository = catLocalRepository
    }
    
    func getCatCategories(completion: @escaping ([CatCategory]) -> ()) {
        catRepository.getCatCategories{
            completion($0)
        }
    }
    
    func saveFavoriteCatCategory(category: CatCategory, onSuccess: (Bool) -> Void,
                                 onFailure:(Error) -> Void) {
        catLocalRepository.saveFavoriteCatCategory(category: category) {onSuccess($0)} onFailure: { Error in
            onFailure(Error)
        }
        
    }
    
    func deleteFavoriteCatCategory(catCategory: CatCategory, onSuccess: (Bool) -> Void,
                                 onFailure:(Error) -> Void) {
        catLocalRepository.deleteFavoriteCatCategory(catCategory: catCategory) {
            onSuccess($0)
        } onFailure: { Error in
            onFailure(Error)
        }
        
    }
    
}
