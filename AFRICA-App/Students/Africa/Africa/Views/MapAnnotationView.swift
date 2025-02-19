//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 17/10/2022.
//

import SwiftUI

struct MapAnnotationView: View {
    
    // MARK: - PROPERTIES
    let location: LocationModel
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(animation + 1)
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        } //: ZStack
        .onAppear { 
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
        
    }
}

// MARK: - PREVIEW
struct MapAnnotationView_Previews: PreviewProvider {
    static var locations: [LocationModel] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: locations[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
