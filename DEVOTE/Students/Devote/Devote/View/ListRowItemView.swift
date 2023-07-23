//
//  ListRowItemView.swift
//  Devote
//
//  Created by Juan Bazan Carrizo on 13/07/2023.
//

import SwiftUI

struct ListRowItemView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
        
    }
}

//struct ListoRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowItemView()
//    }
//}
