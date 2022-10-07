//
//  DailyWeatherDetailView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 22.07.2022.
//

import SwiftUI

struct DailyWeatherDetailView: View {
  let data: Daily
  
  var body: some View {
    List {
      Section("Tarih") {
        Text(Date(timeIntervalSince1970: TimeInterval(data.dt)),
             format: .dateTime.month().day().weekday(.wide))
      }
      
      Section("Hissedilen Sıcaklık") {
        Text("En yüksek: \(Int(data.temp.max)) °")
        Text("En düşük: \(Int(data.temp.min)) °")
        Text("Sabah: \(Int(data.temp.morn)) °")
        Text("Öğlen: \(Int(data.temp.eve)) °")
        Text("Akşam: \(Int(data.temp.night)) °")
      }
      
      Section("Diğer Bilgiler") {
        Text("Rüzgar Hızı: \(Int(data.windSpeed)) km/sa")
        Text("Nem: \(Int(data.humidity))%")
        Text("Basınç: \(Int(data.pressure)) mPa")
        Text("UVI: \(Int(data.uvi))")
        Text("Bulut: \(Int(data.clouds))%")
      }
    }.navigationTitle("Detaylı Hava Durumu")
  }
}

struct DailyWeatherDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DailyWeatherDetailView(data: Daily(dt: 0, sunrise: 0, sunset: 0, moonrise: 0, moonset: 0, moonPhase: 0, temp: Temp(day: 0, min: 0, max: 0, night: 0, eve: 0, morn: 0), feelsLike: FeelsLike(day: 0, night: 0, eve: 0, morn: 0), pressure: 0, humidity: 0, dewPoint: 0, windSpeed: 0, windDeg: 0, windGust: 0, weather: [Weather(id: 0, main: "", weatherDescription: "", icon: "")], clouds: 0, pop: 0, uvi: 0))
    }
  }
}
