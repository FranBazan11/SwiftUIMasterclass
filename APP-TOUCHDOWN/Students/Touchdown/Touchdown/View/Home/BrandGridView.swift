//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 15/01/2023.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - PROPERTIES
    
    let brands: [BrandModel]
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: rowSpacing) {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }
            }//: LazyHGrid
            .frame(height: 200)
//            .padding(<#T##insets: EdgeInsets##EdgeInsets#>)
        }//: ScrollView
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView(brands: brands)
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
