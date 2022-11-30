//
//  HomeCatViewModel.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 24/11/22.
//

import Foundation
import Combine
import SwiftUI

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
    
    @Published var colorLike : Color?  {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var colorNotLike : Color?  {
        didSet {
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
            self.colorLike = Color.gray
            self.colorNotLike = Color.blue
        } onFailure: { 
            self.errorBD = $0.localizedDescription
        }
    }
    
    func deleteFavoriteCatCategory(catCategory: CatCategory){
        catService.deleteFavoriteCatCategory(catCategory: catCategory){
            self.isShowAlert = $0
            self.colorLike = Color.blue
            self.colorNotLike = Color.gray
        } onFailure: {
            self.errorBD = $0.localizedDescription
        }
    }
    
    func fetch(category: CatCategory) {
        catService.getCatCategoryById(idCategory: category.id) {
            if $0 != nil {
                self.colorLike = Color.gray
                self.colorNotLike = Color.blue
            }else{
                self.colorLike = Color.blue
                self.colorNotLike = Color.gray
            }
        
        } onFailure: {
            self.errorBD = $0.localizedDescription
        }
    }
    
    func reload() async {
        await getCatCategory()
    }
}
