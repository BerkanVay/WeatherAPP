//
//  PreferredTemperatureChanger.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 1.08.2022.
//

import Foundation
import SwiftUI
import Combine

class PreferredTemperatureChanger: ObservableObject{
    @AppStorage("lastPreferredTemperature") private var lastPreferredTemperature: PreferredTemperature = .celcius
    @Published var preferredTemperature : PreferredTemperature = .celcius
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(){
        preferredTemperature = lastPreferredTemperature
        
        $preferredTemperature.sink { newValue in
            self.lastPreferredTemperature = newValue
        }.store(in: &cancellables)
    }
}



enum PreferredTemperature: String, Equatable, CaseIterable {
    case celcius = "Celcius"
    case fahrenhayt = "Fahrenhayt"
    case kelvin = "Kelvin"
    
    var temperatureAPIKey: String{
        switch self {
        case .celcius:
            return "metric"
        case .fahrenhayt:
            return "imperial"
        case .kelvin:
            return ""
        }
    }
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
