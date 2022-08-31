//
//  FruitCardView.swift
//  Fructus
//
//  Created by Juan Francisco Bazan Carrizo on 29/08/2022.
//

import SwiftUI

struct FruitCardView: View {
    
    // MARK: -  PROPERTIES
    @State private var isAnimating: Bool = false
    
    // MARK: -  BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // FRUITS: IMAGE
                Image("blueberry")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1 : 0.6)
                
                // FRUITS: TITLE
                Text("Blueberry")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
                
                // FRUITS: HEADLINE
                Text("Blueberries are sweet, nutritious and wildly popular fruit all over the world.")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                // FRUITS: BUTTON
                StartButtonView()
                
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        })
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"),
                                                       Color("ColorBlueberryDark")]),
                           startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

    // MARK: -  PREVIEW
struct FuitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView()
//            .previewLayout(.fixed(width: 320, height: 640))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
        FruitCardView()
//            .previewLayout(.fixed(width: 320, height: 640))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    
    }
}
