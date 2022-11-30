//
//  HomeCatView.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 24/11/22.
//

import SwiftUI

struct HomeCatView: View {
    @ObservedObject var model = HomeCatViewModel()
    var body: some View {
        NavigationView{
            List(model.catCategories) { category in
                CollectionView(data: category)
            }
            .navigationBarTitle("Prueba Diego Ochoa")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    struct HomeCatView_Previews: PreviewProvider {
        static var previews: some View {
            HomeCatView()
        }
    }
}


