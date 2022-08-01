//
//  LottieView.swift
//  WeatherApp
//
//  Created by Mustafa Berkan Vay on 19.07.2022.
//

import SwiftUI
import Lottie
import UIKit


struct LottieView: UIViewRepresentable{
    var jsonName: String = ""
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        animationView.animation = Animation.named(jsonName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}

struct Lottie: View {
    var body: some View {
        NavigationView{
            VStack{
                LottieView(jsonName: "loading")
                    .frame(width: 250, height: 250, alignment: .center)
            }
            .navigationTitle("SwiftUI Lottie")
        }
    }
}

struct Lottie_Previews: PreviewProvider {
    static var previews: some View {
        Lottie()
    }
}
