//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Juan Bazan Carrizo on 29/07/2023.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    
    let note: Note
    let index: Int
    let count: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            } //: HSTACK
            .foregroundColor(.accentColor)
            
            // CONTENT
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            // FOOTER
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
                Text("\(index + 1) / \(count)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }
            .foregroundColor(.secondary)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var data: Note = Note(id: UUID(), text: "Hello, world!")
    static var previews: some View {
        DetailView(note: data, index: 1, count: 5)
    }
}
