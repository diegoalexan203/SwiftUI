//
//  DetailsView.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 28/11/22.
//

import SwiftUI

struct DetailsView: View {
    let data: CatCategory
    @ObservedObject var model = HomeCatViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: data.image?.url ??  "https://acortar.link/pZezzI"),  scale: 7)
                    .frame(width: 200, height: 250)
                    .foregroundColor(.gray)
                    .shadow(radius: 10)
                Spacer()
            }
            HStack {
                Spacer()
                Label {
                    Text(data.name ?? "")
                        .font(.body)
                        .foregroundColor(.primary)
                } icon: {}

                
            }
        }.zIndex(1)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(id: String)
    }
}
