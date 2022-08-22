//
//  LocationModel.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 16.07.2022.
//

import Foundation
import CoreLocation
import SwiftUI

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @EnvironmentObject var preferredTemperatureChanger: PreferredTemperatureChanger

    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastSeenLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
    @Published var weatherData: WeatherResponse?
    var fetchedFirstTime = false

    private let locationManager: CLLocationManager
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastSeenLocation = locations.first
        fetchCountryAndCity(for: locations.first)
    }
    
    func fetchWeatherData() async {
        guard let lastSeenLocation = lastSeenLocation else {
            return
        }
        
        let result = try? await WeatherRESTClient.getWeather(lat: lastSeenLocation.coordinate.latitude, lon: lastSeenLocation.coordinate.longitude, temperatureAPIKey: "metric")
        
        DispatchQueue.main.async {
            self.weatherData = result
        }
    }
    
    func fetchCountryAndCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if placemarks?.first != nil {
                self.currentPlacemark = placemarks?.first
                
                if !self.fetchedFirstTime {
                    Task {
                        await self.fetchWeatherData()
                    }
                    self.fetchedFirstTime = true
                }
            }
        }
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
}


