//
//  LikeCategoriesView.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 30/11/22.
//

import SwiftUI

struct LikeCategoriesView: View {
    @ObservedObject var model = LikeCategoriesViewModel()
    var body: some View {
        List(model.catCategories) { category in
            LikeCollectionView(data: category)
        }
    }
}
  
struct LikeCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        LikeCategoriesView()
    }
}
