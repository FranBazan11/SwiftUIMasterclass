//
//  NewTaskButton.swift
//  Devote
//
//  Created by Juan Bazan Carrizo on 12/07/2023.
//

import SwiftUI

struct NewTaskButton: View {
    @Binding var showNewTaskItem: Bool
    
    var body: some View {
        Button {
            showNewTaskItem = true
        } label: {
            
            Image(systemName: "plus.circle")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            Text("New Task")
                .font(.system(size: 24, weight: .bold, design: .rounded))
        }
        .foregroundColor(.white)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing).clipShape(Capsule()))
        .shadow(radius: 10)
        .frame(maxWidth: .infinity)
    }
}

struct NewTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskButton(showNewTaskItem: .constant(false))
    }
}
