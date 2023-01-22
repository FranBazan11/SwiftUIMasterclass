//
//  SectionView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 19/12/2022.
//

import SwiftUI

struct SectionView: View {
    
    @State var rotateClockwise: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .rotationEffect(.degrees(rotateClockwise ? 90 : -90))
            Spacer()
        }
        .background(colorGray.cornerRadius(12))
//        .frame(width: 85)
    }
}

// MARK: - PREVIEW
struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockwise: true)
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(colorBackground)
    }
}
