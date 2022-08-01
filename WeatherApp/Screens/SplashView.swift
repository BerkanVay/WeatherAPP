//
//  SplashView.swift
//  Weather
//
//  Created by Mustafa Berkan Vay on 19.07.2022.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack (){
                LottieView(jsonName: "splash")
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
