//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 19.07.2022.
//

import SwiftUI

struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.red)

            Text(errorText)
                .foregroundColor(.red)
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorText: "XXX")
    }
}
