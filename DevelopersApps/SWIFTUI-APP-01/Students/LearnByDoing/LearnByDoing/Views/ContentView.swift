//
//  ContentView.swift
//  LearnByDoing
//
//  Created by Juan Bazan Carrizo on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let cards: [CardModel] = cardData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                ForEach(cards) { card in
                    CardView(cardModel: card)
                }
                Spacer()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
