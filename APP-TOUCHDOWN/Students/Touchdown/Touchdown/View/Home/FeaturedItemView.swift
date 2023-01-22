//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 01/12/2022.
//

import SwiftUI

struct FeaturedItemView: View {
    // MARK: - PROPERTIES
    let player: PlayerModel
    
    // MARK: - BODY
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(30)
    }
}

// MARK: - PREVIEW
struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView(player: players[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
