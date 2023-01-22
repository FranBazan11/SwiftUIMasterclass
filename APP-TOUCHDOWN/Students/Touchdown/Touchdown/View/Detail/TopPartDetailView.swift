//
//  TopPartDetailView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 18/01/2023.
//

import SwiftUI

struct TopPartDetailView: View {
    
    // MARK: - PROPERTIES
    
    @State private var isAnimating: Bool = false
    
    @EnvironmentObject var shop: Shop
    
    
    // MARK: - BODY
    var body: some View {
        if let product = shop.selectedProduct {
            HStack(alignment: .center, spacing: 6) {
                // PRICE
                VStack(alignment: .leading, spacing: 6) {
                    Text("Price")
                        .fontWeight(.semibold)
                    
                    // arreglar esto
                    Text(product.formattedPrice)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .scaleEffect(1.35, anchor: .leading)
                }
                .offset(y: isAnimating ? -50 : -75)
                
                Spacer()
                // PHOTO
                
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimating ? 0 : -35)
            } //: HStack
            .onAppear {
                withAnimation(.easeOut(duration: 0.75)) {
                    isAnimating.toggle()
                }
            }
        }
        
    }
}

struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
            .environmentObject(Shop())
            .padding()
    }
}
