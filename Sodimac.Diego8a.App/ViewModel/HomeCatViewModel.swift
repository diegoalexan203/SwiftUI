//
//  HomeCatViewModel.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 24/11/22.
//

import Foundation
import Combine

class HomeCatViewModel:ObservableObject{
    
    var catService: CatServiceProtocol
    
    let didChange = PassthroughSubject<HomeCatViewModel,Never>()
    
    init() {
        self.catService = CatService(catRepository: CatApiRepository(), catLocalRepository: CatLocalRepository())
        getCatCategory()
    }
    
    @Published var catCategories = [CatCategory](){
        didSet{
            didChange.send(self)
        }
    }
    
    @Published var isShowAlert = Bool(){
        didSet{
            didChange.send(self)
        }
    }
    
    @Published var errorBD = String(){
        didSet{
            didChange.send(self)
        }
    }
    
    func getCatCategory(){
        catService.getCatCategories{
            self.catCategories = $0
        }
    }
    
    func saveFavoriteCat(catCategory: CatCategory){
        catService.saveFavoriteCatCategory(category: catCategory) {
            self.isShowAlert = $0
        } onFailure: { 
            self.errorBD = $0.localizedDescription
        }
    }
    
    func deleteFavoriteCatCategory(catCategory: CatCategory){
        catService.deleteFavoriteCatCategory(catCategory: catCategory){
            self.isShowAlert = $0
        } onFailure: {
            self.errorBD = $0.localizedDescription
        }
    }
}
