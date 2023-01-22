//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 17/01/2023.
//

import SwiftUI

struct HeaderDetailView: View {
    
    // MARK: - PROPERTIES
    let productName: String
    
    // MARK: - BODY
    var body: some View {
        
        VStack(alignment: .leading, spacing: 6) {
            Text("Protective Gear")
            Text(productName)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .foregroundColor(.white)
        
    }
}

struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView(productName: products[0].name)
    }
}
