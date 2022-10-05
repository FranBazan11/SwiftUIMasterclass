//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Juan Bazan Carrizo on 02/10/2022.
//

import SwiftUI

struct SettingsRowView: View {
    
    // MARK: - PROPERTIES
    let name: String
    var content: String? = nil
    var  linkName: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if let safeContent = content {
                    Text(safeContent)
                } else if let safeLinkName = linkName,
                          let safeLinkDestination = linkDestination {
                    Link(safeLinkName, destination: URL(string: "https://\(safeLinkDestination)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}
// MARK: - PREVIEW
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Fran",
                            linkName: nil, linkDestination: nil)
                .previewLayout(.sizeThatFits)
            .padding()
            SettingsRowView(name: "Webside", content: nil,
                            linkName: "SwiftUI", linkDestination: "swiftuimasterclass.com")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
