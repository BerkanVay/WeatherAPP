//
//  TrackingView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 19.07.2022.
//

import SwiftUI
import CoreLocation

struct TrackingView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    private func viewIfWeatherDataIsPresent<T: View>(_ content: (_ weatherData: WeatherResponse) -> T) -> AnyView {
        if let weatherData = locationViewModel.weatherData {
            return AnyView(content(weatherData))
        }
        
        return AnyView(EmptyProgressView())
    }
    
    var body: some View {
        NavigationView {
            List {
                Section("Şu An") {
                    viewIfWeatherDataIsPresent(CurrentPlaceWeatherView.init)
                        .listRowBackground(Color.blue)
                }
                .headerProminence(.increased)
                
                Section("Saatlik") {
                    viewIfWeatherDataIsPresent(HourlyWeatherScrollView.init)
                }
                .headerProminence(.increased)
                
                Section("Günlük") {
                    viewIfWeatherDataIsPresent(DailyWeatherListView.init)
                }
                .headerProminence(.increased)
            }
            .toolbar(content: {
                ToolbarItem {
                    NavigationLink(destination: {
                        SettingsView()
                    }, label: {
                        Image(systemName: "gearshape.fill")
                    })
                }
            })
            .refreshable(action: locationViewModel.fetchWeatherData)
            .navigationTitle("Hava Durumu")
        }
    }
}
struct EmptyProgressView: View {
    var body: some View{
        VStack {
            ProgressView()
                .frame(maxWidth: .infinity)
        }
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
            .environmentObject(LocationViewModel())
    }
}
