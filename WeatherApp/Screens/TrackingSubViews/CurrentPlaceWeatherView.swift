//
//  CurrentPlaceWeatherView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 24.07.2022.
//

import SwiftUI

struct CurrentPlaceWeatherView: View {
    let weatherData: WeatherResponse
    
    var separatedCurrentPlace: String {
        return weatherData.timezone.components(separatedBy: "/")[1].replacingOccurrences(of: "_", with: " ")
    }
    
    var body: some View {
        VStack {
            Text("\(Int(weatherData.hourly[0].feelsLike))°")
                .font(.system(size: 100))
            Text(separatedCurrentPlace)
                .font(.system(size: 50))
            
            Text("Son Güncelleme")
            
            Text(
                Date(timeIntervalSince1970: TimeInterval(weatherData.current.dt)),
                format: .dateTime
            )
            Text("\(weatherData.current.weather[0].weatherDescription.capitalized)")
            Text("Y:\(Int(weatherData.daily[0].temp.max))° D:\(Int(weatherData.daily[0].temp.min))°")
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
    }
}
