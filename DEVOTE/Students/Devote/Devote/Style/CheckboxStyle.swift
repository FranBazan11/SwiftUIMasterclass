//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Juan Bazan Carrizo on 14/07/2023.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        } //: HSTACK
    }
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder", isOn: .constant(true))
            .toggleStyle(CheckboxStyle())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
