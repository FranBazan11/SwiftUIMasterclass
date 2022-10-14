//
//  CoverImageView.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 06/10/2022.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - PROPERTIES
    let coverImage:[CoverImageModel] = Bundle.main.decode("covers.json")
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImage) { image in
                Image(image.name)
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
        
    }
}

// MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
//            .previewLayout(.fixed(width: 400, height: 300))
    }
}
