//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 16.07.2022.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject var preferredColorSchemeChanger = PreferredColorSchemeChanger()
    @StateObject var preferredTemperaturesChanger = PreferredTemperatureChanger()
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .preferredColorScheme(preferredColorSchemeChanger.preferredColorScheme.colorScheme).environmentObject(preferredColorSchemeChanger)
                .environmentObject(preferredTemperaturesChanger)
        }
    }
}
