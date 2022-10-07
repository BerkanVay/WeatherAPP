//
//  WeatherRESTClient.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 16.07.2022.
//

import Foundation

class WeatherRESTClient {
  enum NetworkingError: Error {
    case invalidURL
  }
  
  private static let jsonDecoder = JSONDecoder()
  
  static func getWeather(lat: Double, lon: Double, temperatureAPIKey: String) async throws -> WeatherResponse {
    let requestString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&lang=tr&units=\(temperatureAPIKey)&appid=cfed8600de9d4cc1e03a9700924af1c6"
    print(requestString)
    
    return try await doRequest(withURLString: requestString)
  }
  
  private static func doRequest<T: Decodable>(
    withURLString urlString: String
  ) async throws -> T {
    guard let url = URL(string: urlString) else {
      throw NetworkingError.invalidURL
    }
    
    let (data, _) = try await URLSession.shared.data(
      from: url
    )
    
    return try jsonDecoder.decode(T.self, from: data)
  }
}
