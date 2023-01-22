//
//  ContentView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 11/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                if shop.showingProduct == false && shop.selectedProduct == nil {
                    VStack(alignment: .center, spacing: 0) {
                    NavigationBarView()
                        .padding()
                        .background(.white)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(spacing: 10) {
                            FeaturedTabView()
                                .frame(height: UIScreen.main.bounds.width / 1.6)
                                .padding(.vertical)
                            
                            // CATEGORIES
                            CategoryGridView()
                                .padding(.horizontal)
                            
                            // HELMETS
                            TitleView(title: "Helmets")
                                .padding(.horizontal)
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: columnSpacing) {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            withAnimation(.easeOut) {
                                                feedback.impactOccurred()
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal)
                            
                            // BRANDS
                            TitleView(title: "Brands")
                                .padding(.horizontal)
                            BrandGridView(brands: brands)
                                .padding(.horizontal)
                                
                            FooterView()
                                .padding(.horizontal)
                        }//: VStack
                    }
                }
                    .background(colorBackground.ignoresSafeArea(.all, edges: .all))
                } else {
                    ProductDetailView()
                }
            }
        }
        .statusBar(hidden: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
