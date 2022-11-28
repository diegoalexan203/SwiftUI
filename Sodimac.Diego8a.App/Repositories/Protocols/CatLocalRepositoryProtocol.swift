//
//  CatLocalRepositoryProtocol.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 25/11/22.
//

import Foundation

protocol CatLocalRepositoryProtocol {
    func saveFavoriteCatCategory(category: CatCategory, onSuccess: (Bool) -> Void,
                                 onFailure:(Error) -> Void)
    
    func deleteFavoriteCatCategory(catCategory: CatCategory, onSuccess: (Bool) -> Void,
                                 onFailure:(Error) -> Void)
}
