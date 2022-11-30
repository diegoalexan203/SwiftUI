//
//  TabCatView.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 30/11/22.
//

import SwiftUI

struct TabCatView: View {
    @State private var currentTab = 0
    @State var tab: Int = 0
    @StateObject var model: LikeCategoriesViewModel = LikeCategoriesViewModel()
    
    var body: some View {
        TabView{
            HomeCatView()
                .tabItem{
                    Label("Categoria de gatos", systemImage: "pawprint.fill")
                    
                }
            LikeCategoriesView()
                .tabItem{
                    Label("Categorias que me Gustan", systemImage: "hand.thumbsup.circle")
                }.onSubmit {
                    model.getLocalCatCategory()
                }.onAppear{
                    model.getLocalCatCategory()
                }
        }.accentColor(.black)
            .onAppear() {
                model.getLocalCatCategory()
            }
            .onChange(of: tab, perform: { newValue in
                print("Tab changed: ", newValue)
            })
            .environmentObject(model)
    }
}

struct TabCatView_Previews: PreviewProvider {
    static var previews: some View {
        TabCatView()
    }
}
