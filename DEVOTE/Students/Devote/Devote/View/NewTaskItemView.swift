//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Juan Bazan Carrizo on 12/07/2023.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State var task: String = ""
    @Binding var isShowing: Bool
    @FocusState private var hideKeyboard: Bool
    
    private var isButtonDisabled: Bool { task.isEmpty }
    
    // MARK: - PRIVATE FUNCS
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
                
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard = false
            isShowing = false
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                TextField("New task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(isDarkMode ? Color(UIColor.tertiarySystemBackground) :Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .focused($hideKeyboard)
                Button {
                    addItem()
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(isButtonDisabled)
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.pink.opacity(0.6) : Color.pink)
                .cornerRadius(10)
            } //: VSTACK
            .onSubmit {
                addItem()
            }
            .padding()
            .background(isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white)
            .cornerRadius(16)
            .shadow(radius: 24)
        } //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(false))
            .background(Color.gray)
            .background(ignoresSafeAreaEdges: .all)
    }
}
