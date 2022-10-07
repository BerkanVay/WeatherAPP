//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 16.07.2022.
//

import SwiftUI


struct ContentView: View {
  @StateObject var locationViewModel = LocationViewModel()
  
  var body: some View {
    switch locationViewModel.authorizationStatus {
    case .notDetermined:
      AnyView(RequestLocationView())
        .environmentObject(locationViewModel)
    case .restricted:
      ErrorView(errorText: "Location use is restricted.")
    case .denied:
      ErrorView(errorText: "The app does not have location permissions. Please enable them in settings.")
    case .authorizedAlways, .authorizedWhenInUse:
      TrackingView()
        .environmentObject(locationViewModel)
    default:
      Text("Unexpected status")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    
  }
}
