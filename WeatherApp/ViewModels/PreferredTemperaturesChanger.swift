//
//  PreferredTemperaturesChanger.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 1.08.2022.
//

import Foundation
import SwiftUI
import Combine

class PreferredTemperaturesChanger: ObservableObject{
    @AppStorage("lastPreferredTemperatures") private var lastPreferredTemperatures: PreferredTemperatures = .celcius
    @Published var preferredTemperatures : PreferredTemperatures = .celcius
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(){
        preferredTemperatures = lastPreferredTemperatures
        
        $preferredTemperatures.sink { newValue in
            self.lastPreferredTemperatures = newValue
        }.store(in: &cancellables)
    }
}



enum PreferredTemperatures: String, Equatable, CaseIterable {
    case celcius = "Celcius"
    case fahrenhayt = "Fahrenhayt"
    case kelvin = "Kelvin"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
