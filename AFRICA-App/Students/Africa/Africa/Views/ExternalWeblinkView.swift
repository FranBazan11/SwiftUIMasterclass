//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 14/10/2022.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - PROPERTIES
    let animal: AnimalModel
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!) { 
                        Text(animal.name)
                    }
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

// MARK: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
