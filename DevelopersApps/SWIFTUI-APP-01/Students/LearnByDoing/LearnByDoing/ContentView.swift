//
//  ContentView.swift
//  LearnByDoing
//
//  Created by Juan Bazan Carrizo on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(0 ..< 6) { item in
                    CardView()
                }
            }
            .padding(.horizontal)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
