//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 13/12/2022.
//

import SwiftUI

struct CategoryGridView: View {
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: rowSpacing) {
                ForEach(categories) { category in
                    CategoryItemView(category: category)
                }
            } //: LazyHGrid
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            
        } //: ScrollView
    }
}

// MARK: - PREVIEW
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
