//
//  InsetFactsView.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 13/10/2022.
//

import SwiftUI

struct InsetFactsView: View {
    // MARK: - PROPERTIES
    
    let animal: AnimalModel
    
    // MARK: - BODY
    
    var body: some View {
        GroupBox {
            TabView { 
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TabView
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: GroupBox
    }
}

// MARK: - PREVIEW
struct InsetFactsView_Previews: PreviewProvider {
    static var animals: [AnimalModel] = Bundle.main.decode("animals.json") 
    static var previews: some View {
        InsetFactsView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
