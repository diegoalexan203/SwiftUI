//
//  LikeCollectionView.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 30/11/22.
//

import SwiftUI

struct LikeCollectionView: View {
    var data: CatCategory?
    @ObservedObject var model = HomeCatViewModel()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: data?.image?.url ??  "https://acortar.link/pZezzI"),  scale: 7)
                    .frame(width: 200, height: 250)
                    .foregroundColor(.gray)
                    .shadow(radius: 10)
                    .padding()
                Spacer()
            }
            HStack {
                Spacer()
                
                Text(self.data!.name).multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                
            }
        }.zIndex(1)
    }
}

struct LikeCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        LikeCollectionView()
    }
}
