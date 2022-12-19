//
//  ContentView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 11/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            NavigationBarView()
                .padding()
                .background(.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {
                    FeaturedTabView()
                        .frame(height: UIScreen.main.bounds.width / 1.6)
                        .padding(.vertical, 20)
                    FooterView()
                        .padding(.horizontal)
                }
            }
            
        }
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
