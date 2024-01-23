//
//  RecipesView.swift
//  Avocados
//
//  Created by Juan Bazan Carrizo on 16/10/2023.
//

import SwiftUI

struct RecipesView: View {
    var body: some View {
        List {
                    Text("Home Content")
                        .frame(height: 1000)
                }
                .navigationTitle("Home Title")
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
