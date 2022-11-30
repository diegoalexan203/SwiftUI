//
//  ManagerDB.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 25/11/22.
//

import Foundation
import SQLite

class ManagerDB{
    var catDB: Connection!
    var path: String = "CatDB.sqlite3"
    let catTable = Table("catCategory")
    
    let id = Expression<String>("id")
    let name = Expression<String>("name")
    let date = Expression<String>("date")
    let catImage = Expression<String>("catImage")
    let descritpion = Expression<String>("descritpion")
    
    init() {
        catDB = createDatabase()
        createTableCatCategory()
    }
    
    func createDatabase() -> Connection! {
        do {
            let filepath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathExtension(path)
            
            let db = try Connection(filepath.path)
            print("database created with path \(filepath.path)")
            return db
        } catch {
            print(error)
            return nil
        }
    }
    
    func createTableCatCategory() {
        let tableToCreate = catTable.create { table in
            table.column(id)
            table.column(name)
            table.column(date)
            table.column(catImage)
            table.column(descritpion)
        }
        do {
            try catDB.run(tableToCreate)
        } catch {
            print(error)
        }
    }
    
    func create(catCategory: CatCategory) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        let catCategoryToInsert = catTable.insert(id <- catCategory.id, name <- catCategory.name, date <- dateFormatter.string(from: Date()), catImage <- catCategory.image!.url,
                                                  descritpion <- catCategory.catCategoryDescription ?? "" )
        try catDB.run(catCategoryToInsert)
        print("Cat Category registered successfully")
    }
    
    func deleteCatCategory(catCategory: CatCategory) throws -> Int{
        let categoryDelete: Table = catTable.filter(id == catCategory.id)
        let delete = categoryDelete.delete()
        return try catDB.run(delete)
    }
    
    func GetCatCategories() -> [CatCategory] {
        var categoriesArray = [CatCategory]()
        
        do {
            let categories = try catDB.prepare(catTable)
            
            for category in categories {
                let catImage = CatImage(id: "", width: 0, height: 0, url: category[catImage])
                let categoryScoped = CatCategory(id: category[id], name: category[name], catCategoryDescription: category[descritpion], lifeSpan: "", wikipediaURL: "", image: catImage, date: category[date])
                    categoriesArray.append(categoryScoped)
            }
            return categoriesArray
        } catch {
            print(error)
            return categoriesArray
        }
    }
    
    func getCatCategoryById(idCategory: String) -> CatCategory? {
        let categoryFromDb: Table = catTable.filter(id == idCategory)
        var category: CatCategory?
        do{
            for categoryGetted in try catDB.prepare(categoryFromDb){
                var catImage = CatImage(id: "", width: 0, height: 0, url: categoryGetted[catImage])
                category = CatCategory(id: categoryGetted[id], name: categoryGetted[name], catCategoryDescription: categoryGetted[descritpion], lifeSpan: "", wikipediaURL: "", image: catImage, date: categoryGetted[date])
                return category
            }
        } catch {
            print(error)
        }
        return category
    }
}
