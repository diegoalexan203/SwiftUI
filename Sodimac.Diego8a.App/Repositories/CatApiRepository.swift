//
//  CatApiRepository.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 24/11/22.
//

import Foundation

class CatApiRepository: CatApiRepositoryProtocol {
    func getCatCategories(completion: @escaping ([CatCategory]) -> ()) {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
            fatalError("No se puede acceder al recurso")
        }
        URLSession.shared.dataTask(with: url){ data, responseApi, error in
            guard let dataResponse = data, error == nil, let response = responseApi as? HTTPURLResponse else{
                return
            }
            if response.statusCode == 200{
                do {
                    let categories = try JSONDecoder().decode([CatCategory].self, from: dataResponse)
                    DispatchQueue.main.async {
                        completion(categories)
                    }
                }catch let error{
                    print("Se presento un errror:\(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    
}
