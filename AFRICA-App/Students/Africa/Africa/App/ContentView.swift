//
//  ContentView.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 05/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: -5, leading: 0,
                                              bottom: -5, trailing: 0))
                    .padding(.vertical)
                
                ForEach(animals) { animal in
                    NavigationLink {
                        AnimalDetailView(animal: animal)
                    } label: {
                        AnimalListItemView(animal: animal)
                    }
                }
            } //: LIST
            .listStyle(.inset)
            .navigationTitle("AFRICA")
            .navigationBarTitleDisplayMode(.large)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
