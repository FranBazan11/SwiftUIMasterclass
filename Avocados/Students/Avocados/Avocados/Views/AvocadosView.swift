//
//  AvocadosView.swift
//  Avocados
//
//  Created by Juan Bazan Carrizo on 16/10/2023.
//

import SwiftUI

struct AvocadosView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
            
            Text("Avocados")
                .font(.system(size: 42, weight: .bold, design: .serif))
                .foregroundColor(.white)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
            
            Text("Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!")
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(6)
            Spacer()
        }
        .padding()
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .ignoresSafeArea()
    }
}

struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
        
    }
}
