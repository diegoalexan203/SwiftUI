//
//  Sodimac_Diego8a_AppApp.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 19/11/22.
//

import SwiftUI

@main
struct Sodimac_Diego8a_AppApp: App {
    @State private var currentTab = 0
    @State var tab: Int = 0
    @StateObject var model: LikeCategoriesViewModel = LikeCategoriesViewModel()
    
    var body: some Scene {
        WindowGroup{
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
}
