//
//  DetailsView.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 28/11/22.
//

import SwiftUI

struct DetailsView: View {
    var data: CatCategory?
    @ObservedObject var model = HomeCatViewModel()
    @State private var showingAlert = false
    @State private var message = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: data?.image?.url ??  "https://acortar.link/pZezzI"),  scale: 7)
                    .frame(width: 200, height: 250)
                    .foregroundColor(.gray)
                    .shadow(radius: 10)
                Spacer()
                
            }.padding()
            VStack{
                HStack{
                    Spacer()
                    Button(role: .none, action: {
                        model.saveFavoriteCat(catCategory: data!)
                        message = "Se ha guardado su categoria de gato favorito"
                        showingAlert = model.isShowAlert
                    }) {
                        Label("", systemImage: "hand.thumbsup.fill")
                    }.padding(.all, 6.0).zIndex(0)
                        .foregroundColor(model.colorLike)
                        .disabled(model.likeEnabled)
                    Spacer()
                    Button(role: .none, action: {
                        model.deleteFavoriteCatCategory(catCategory: data!)
                        if model.isShowAlert{
                            message = "Se ha eliminado su categoria de gato favorito"
                            showingAlert = model.isShowAlert
                        }else{
                            message = "No se ha podido eliminar la categoria de gatos favoritos, Puede ser que no exista localmente"
                            showingAlert = true
                        }
                    }) {
                        Label("", systemImage: "hand.thumbsdown.fill")
                    }
                    .foregroundColor(model.colorNotLike)
                    .disabled(model.notLikeEnabled)
                    Spacer()
                        .alert(message, isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                }.padding()
            }
            VStack {
                
                Label{
                    Text(data?.catCategoryDescription ?? "")
                        .font(.body)
                        .foregroundColor(.primary)
                }icon: {}
                Spacer()
                
                
            }.padding()
        }.zIndex(1)
            .onAppear(perform: fetch)
    }
    private func fetch() {
        model.fetch(category: data!)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
