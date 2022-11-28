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
    let date = Expression<Date>("date")
    let favorite = Expression<Bool>("favorite")
    
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
            table.column(favorite)
        }
        do {
            try catDB.run(tableToCreate)
        } catch {
            print(error)
        }
    }
    
    func create(catCategory: CatCategory) throws {
        let catCategoryToInsert = catTable.insert(id <- catCategory.id, name <- catCategory.name, date <- Date.now, favorite <- catCategory.favorite ?? false)
        try catDB.run(catCategoryToInsert)
        print("Cat Category registered successfully")
    }
    
    func deleteCatCategory(catCategory: CatCategory) throws -> Int{
        let categoryDelete: Table = catTable.filter(id == catCategory.id)
        let delete = categoryDelete.delete()
        return try catDB.run(delete)
    }
    
    func getUsers() -> [CatCategory] {
        var categoriesArray = [CatCategory]()
        
        do {
            let categories = try catDB.prepare(catTable)
            
            for category in categories {
                let categoryScoped = CatCategory(id: category[id], name: category[name], catCategoryDescription: nil, lifeSpan: nil, wikipediaURL: nil, image: nil)
                categoriesArray.append(categoryScoped)
            }
            return categoriesArray
        } catch {
            print(error)
            return categoriesArray
        }
    }
}
