//
//  ContentView.swift
//  Devote
//
//  Created by Juan Bazan Carrizo on 13/03/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var showNewTaskItem: Bool = false
    // MARK: - FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Item>
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: MAIN VIEW
                VStack {
                    // MARK: HEADER
                    Spacer(minLength: 80)
                    
                    // MARK: NEW TASK BUTTON
                    NewTaskButton(showNewTaskItem: $showNewTaskItem)
                    
                    // MARK: TASKS
                    if ( items.count == 0 ) {
                        Spacer()
                    } else {
                        List {
                            ForEach(items) { item in
                               ListRowItemView(item: item)
                                    .onTapGesture {
                                        item.completion.toggle()
                                    }
                            }
                            .onDelete(perform: deleteItems)
                        } //: LIST
                        .shadow(radius: 10)
                        .listStyle(.insetGrouped)
                        .frame(maxHeight: .infinity)
                        .scrollContentBackground(.hidden)
                    }
                    
                } //: VSTACK
                .blur(radius: showNewTaskItem ? 8 : 0)
                .transition(.move(edge: .bottom))
                // MARK: NEW TASK ITEM
                if showNewTaskItem {
                    BlankView()
                        .onTapGesture {
                            withAnimation {
                                showNewTaskItem = false
                            }
                        }
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
                
            } //: ZSTACK
            .background(BackgroundImageView().blur(radius: showNewTaskItem ? 6 : 0, opaque: false))
            .background(backgroundGradient)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.trailing, 5)
                        .frame(minWidth: 50, minHeight: 24)
                        .background(
                            Capsule().stroke(Color.white, lineWidth: 2))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        isDarkMode.toggle()
                    } label: {
                        Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                            .resizable()
                            .scaledToFit()
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundColor(isDarkMode ? Color(UIColor.secondarySystemBackground) : .white)
                    }
                       
                }
            } //: TOOLBAR
            .navigationTitle("Daily Tasks")
            .navigationBarTitleDisplayMode(.large)
        } //: NAVIGATION
    }

    // MARK: - PRIVATE FUNCS
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
