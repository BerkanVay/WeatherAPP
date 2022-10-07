//
//  HourlyScrollView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 22.07.2022.
//

import SwiftUI

struct HourlyWeatherScrollView: View {
    let weatherData: WeatherResponse
    
    var body: some View{
        ScrollView (.horizontal, showsIndicators: false){
            HStack {
                ForEach(weatherData.hourly) { hourly in
                    if weatherData.hourly[0].dt == hourly.dt{
                        HourlyWeatherView(dayTime: 0, iconId: hourly.weather[0].icon, temperature: Int(hourly.temp))
                    } else {
                        HourlyWeatherView(dayTime: hourly.dt, iconId: hourly.weather[0].icon, temperature: Int(hourly.temp))
                    }
                    
                }
                
            }
        }
    }
}

struct HourlyWeatherView: View {
    let dayTime: Int
    let iconId: String
    let temperature: Int
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(iconId)@2x.png"))
                .frame(width: 40, height: 40, alignment: .center)
                .scaledToFit()
                .padding(20)
            if dayTime == 0 {
                Text("Şu an")
            } else {
                Text(
                    Date(
                        timeIntervalSince1970: TimeInterval(dayTime)
                    ), style: .time
                )
            }
            Text("\(temperature) °")
        }
        
    }
}

struct HourlyWeatherView_Preview: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(dayTime: 0, iconId: "01d", temperature: 0).previewLayout(.sizeThatFits)
    }
}
