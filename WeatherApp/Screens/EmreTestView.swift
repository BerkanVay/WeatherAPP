//
//  EmreTestView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 21.07.2022.
//

import SwiftUI

struct EmreTestView: View {
    @State var selection = 4
    @State var items = [0, 1, 2, 3, 4]
    @State var show = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Showing?", isOn: $show.animation())
                
                Text("s.a.")
                
                if show {
                    Picker("Testing", selection: $selection) {
                        ForEach(items, id: \.self) { item in
                            Text("\(item)")
                        }
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
}

struct EmreTestView_Previews: PreviewProvider {
    static var previews: some View {
        EmreTestView()
    }
}
