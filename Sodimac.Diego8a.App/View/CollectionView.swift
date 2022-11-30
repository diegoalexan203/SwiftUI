//
//  CollectionView.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 24/11/22.
//

import SwiftUI

struct CollectionView: View {
    var data: CatCategory
    @ObservedObject var model = HomeCatViewModel()
    @State private var showingAlert = false
    @State private var message = ""
    
    var body: some View{
        VStack {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: data.image?.url ??  "https://acortar.link/pZezzI"),  scale: 7)
                    .frame(width: 200, height: 250)
                    .foregroundColor(.gray)
                    .shadow(radius: 10)
                    .padding()
                Spacer()
                let details = DetailsView(data: data)
                NavigationLink(destination: details
                    .navigationTitle(data.name)
                    .navigationBarHidden(false)
                ) {
                    Text("Ver")
                }
            }
            HStack {
                Spacer()
                Button(role: .none, action: {}) {
                    Label("", systemImage: "hand.thumbsup.fill")
                }.padding(.all, 6.0).zIndex(0)
                    .onTapGesture {
                        model.saveFavoriteCat(catCategory: data)
                        message = "Se ha guardado su categoria de gato favorito"
                        showingAlert = model.isShowAlert
                    }.foregroundColor(model.colorLike)
                Text(self.data.name).multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Button(role: .none, action: {}) {
                    Label("", systemImage: "hand.thumbsdown.fill")
                }.onTapGesture {
                    model.deleteFavoriteCatCategory(catCategory: data)
                    if model.isShowAlert{
                        message = "Se ha eliminado su categoria de gato favorito"
                        showingAlert = model.isShowAlert
                    }else{
                        message = "No se ha podido eliminar la categoria de gatos favoritos, Puede ser que no exista localmente"
                        showingAlert = true
                    }
                }.foregroundColor(model.colorNotLike)
                
                    .alert(message, isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                
            }
        }.zIndex(1)
            .onAppear(perform: fetch)
    }
    
    private func fetch() {
        model.fetch(category: data)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCatView().environment(\.colorScheme, .light)
    }
}

