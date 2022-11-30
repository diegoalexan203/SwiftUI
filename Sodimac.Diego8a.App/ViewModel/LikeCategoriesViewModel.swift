//
//  LikeCategoriesViewModel.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 30/11/22.
//
import Foundation
import Combine


class LikeCategoriesViewModel:ObservableObject{
    
    var catService: CatServiceProtocol
    
    let didChange = PassthroughSubject<LikeCategoriesViewModel,Never>()
    
    @Published var catCategories = [CatCategory](){
        didSet{
            didChange.send(self)
        }
    }
    
    init() {
        self.catService = CatService(catRepository: CatApiRepository(), catLocalRepository: CatLocalRepository())
        getLocalCatCategory()
    }
    
    func getLocalCatCategory(){
        catService.getLocalCatCategories(){
            self.catCategories = $0
        }
    }
}

