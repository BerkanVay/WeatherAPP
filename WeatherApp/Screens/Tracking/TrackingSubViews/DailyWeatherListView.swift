//
//  DailyWeatherListView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 22.07.2022.
//

import SwiftUI

struct DailyWeatherView: View {
    var isFirst: Bool
    var data: Daily
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(data.weather[0].icon)@2x.png"))
                .frame(width: 40, height: 40, alignment: .center)
                .scaledToFit()
            VStack(alignment: .leading, spacing: 10) {
                if isFirst {
                    Text("Bugün")
                }
                else {
                    Text(
                        Date(
                            timeIntervalSince1970: TimeInterval(data.dt)
                        ),
                        format: .dateTime.weekday(.wide)
                    )
                }
                    Text("\(Int(data.temp.day)) °")
            }
        }.padding(20)
    }
}

struct DailyWeatherListView: View {
    let weatherData: WeatherResponse
    
    var body: some View {
        ForEach(weatherData.daily) {data in
            NavigationLink {
                DailyWeatherDetailView(data: data)
            } label: {
                if data.dt == weatherData.daily[0].dt {
                    DailyWeatherView(isFirst: true, data: data)
                } else {
                    DailyWeatherView(isFirst: false, data: data)
                }
            }
        }
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(isFirst: true, data: Daily(dt: 0, sunrise: 0, sunset: 0, moonrise: 0, moonset: 0, moonPhase: 0.0, temp: Temp(day: 0, min: 0, max: 0, night: 0, eve: 0, morn: 0), feelsLike: FeelsLike(day: 0, night: 0, eve: 0, morn: 0), pressure: 0, humidity: 0, dewPoint: 0, windSpeed: 0, windDeg: 0, windGust: 0, weather: [Weather(id: 0, main: "sea", weatherDescription: "sea", icon: "")], clouds: 0, pop: 0, uvi: 0)).previewLayout(.sizeThatFits)
    }
}
