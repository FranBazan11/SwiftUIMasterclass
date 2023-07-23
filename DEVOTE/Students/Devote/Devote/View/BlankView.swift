//
//  BlankView.swift
//  Devote
//
//  Created by Juan Bazan Carrizo on 12/07/2023.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        Spacer()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.black.opacity(0.5))
            .blendMode(.overlay)
            .ignoresSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea())
    }
}
