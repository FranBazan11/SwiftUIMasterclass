//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Juan Bazan Carrizo on 23/09/2022.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox() {
            HStack {
                Text("Content source")
                    .fontWeight(.semibold)
                Spacer()
                Link(destination: URL(string: "https://wikipedia.com")!) {
                    Text("Wikipedia")
                        .fontWeight(.semibold)
                }
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
