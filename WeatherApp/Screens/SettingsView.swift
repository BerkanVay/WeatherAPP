//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 24.07.2022.
//

import SwiftUI


struct SettingsView: View {
    
    @EnvironmentObject var preferredColorSchemeChanger: PreferredColorSchemeChanger
    @EnvironmentObject var preferredTemperatureChanger: PreferredTemperatureChanger
    
    
    var body: some View {
        VStack{
            List{
                Section {
                  
                    Picker("Tema Seçimi", selection: $preferredColorSchemeChanger.preferredColorScheme ) {
                    ForEach(PreferredColorScheme.allCases, id: \.self) { value in
                        Text(value.localizedName)
                    }
                }
            }
                Section {
                    Picker("Derece Seçimi", selection: $preferredTemperatureChanger.preferredTemperature ) {
                        ForEach(PreferredTemperature.allCases, id: \.self) { value in
                            Text(value.localizedName)
                        }
                    }

                }
            }

            
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
