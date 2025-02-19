//
//  HeadingView.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 06/10/2022.
//

import SwiftUI

struct HeadingView: View {
    
    // MARK: - PROPERTIES
    
    let headingImage: String
    let headingText: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

// MARK: - PREVIEW
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "phone.on.rectangle.angled", headingText: "Wilderness in Pictures")
    }
}
