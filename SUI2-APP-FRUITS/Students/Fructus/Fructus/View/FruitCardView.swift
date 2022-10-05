//
//  FruitCardView.swift
//  Fructus
//
//  Created by Juan Francisco Bazan Carrizo on 29/08/2022.
//

import SwiftUI

struct FruitCardView: View {
    
    // MARK: -  PROPERTIES
    
    let fruit: Fruit
    
    @State private var isAnimating: Bool = false
    
    // MARK: -  BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // FRUITS: IMAGE
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1 : 0.6)
                
                // FRUITS: TITLE
                Text(fruit.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
                
                // FRUITS: HEADLINE
                Text(fruit.headline)
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
        .onDisappear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = false
            }
        })
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors),
                           startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

    // MARK: -  PREVIEW
struct FuitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[0])
//            .previewLayout(.fixed(width: 320, height: 640))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
        FruitCardView(fruit: fruitsData[2])
//            .previewLayout(.fixed(width: 320, height: 640))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    }
}
