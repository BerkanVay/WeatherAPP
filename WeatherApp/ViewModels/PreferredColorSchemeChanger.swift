//
//  PreferredColorSchemeChanger.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 25.07.2022.
//

import Foundation
import SwiftUI
import Combine

class PreferredColorSchemeChanger: ObservableObject {
  @AppStorage("lastPreferredColorScheme") private var lastPreferredColorScheme: PreferredColorScheme = .system
  @Published var preferredColorScheme: PreferredColorScheme = .system
  
  private var cancellables: Set<AnyCancellable> = []
  
  init() {
    preferredColorScheme = lastPreferredColorScheme
    
    $preferredColorScheme.sink { newValue in
      self.lastPreferredColorScheme = newValue
    }.store(in: &cancellables)
  }
}

enum PreferredColorScheme: String, Equatable, CaseIterable {
  case system = "Sistem Teması"
  case dark = "Koyu Tema"
  case light = "Açık Tema"
  
  var colorScheme: ColorScheme? {
    switch self {
    case .system:
      return nil
    case .dark:
      return .dark
    case .light:
      return .light
    }
  }
  
  var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
