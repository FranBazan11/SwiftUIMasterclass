//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 27/12/2022.
//

import SwiftUI

struct BrandItemView: View {
    // MARK: - PROPERTIES
    
    let brand: BrandModel
    
    // MARK: - BODY
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
            .background(
                RoundedRectangle(cornerRadius: 12).stroke(Color.black,
                                                          lineWidth: 2)
            )
            .padding(2)
    }
}

// MARK: - PREVIEW
struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: brands[0])
            .previewLayout(.sizeThatFits)
//            .padding()
            .background(colorBackground)
    }
}
