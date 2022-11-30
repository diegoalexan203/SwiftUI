//
//  SplashView.swift
//  Sodimac.Diego8a.App
//
//  Created by Diego Ochoa on 30/11/22.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack{
            if self.isActive {
                TabCatView()
            } else {
                Image("SplashImage").frame(width: 200).frame(height: 300)
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
