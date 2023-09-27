//
//  CardView.swift
//  LearnByDoing
//
//  Created by Juan Bazan Carrizo on 27/09/2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    let gradientColors: [Color] = [Color("Color01"), Color("Color02")]
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("developer-no1")
            
            VStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Text("Pancho")
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
                
                Spacer()
                Button {
                } label: {
                    HStack {
                        Text("LEARN".uppercased())
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        .tint(.accentColor)
                        Image(systemName: "arrow.right.circle")
                            .foregroundColor(.white)
                            .font(.title.weight(.medium))
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                }

            } //: VStack
            .padding(.bottom, 35)
            .padding(.top, 25)
        }
        .frame(height: 545)
        .background(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
