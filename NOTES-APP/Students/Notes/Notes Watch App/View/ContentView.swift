//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Juan Bazan Carrizo on 26/07/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    // MARK: - FUNCS
    
    private func save() {
        do {
            // 1. Convert the notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            
            // 2. Create a new URL to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathExtension("notes")
            
            // 3. Write the data to the given URL
            try data.write(to: url)
        } catch {
            print("Saving data has failed!")
        }
    }
    
    private func load() {
        DispatchQueue.main.async {
            do {
                // 1. Get the notes URL path
                let url = getDocumentDirectory().appendingPathExtension("notes")
                
                // 2. Create the new property for the data
                let data = try Data(contentsOf: url)
                
                // 3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {}
        }
    }
    
    private func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    private func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new note", text: $text)
                    Button {
                        guard text.isEmpty == false else { return }
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        save()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .fixedSize()
                    .tint(.accentColor)
                } //: HSTACK
                if notes.count > 0 {
                    List{
                        ForEach(notes, id: \.self) { note in
                            NavigationLink {
                                DetailView(note: note, index: notes.firstIndex(of: note) ?? 0, count: notes.count)
                            } label: {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(Color.accentColor)
                                    Text(note.text)
                                        .lineLimit(1)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray.opacity(0.25))
                        .frame(width: 50)
                    Spacer()
                }
            } //: VSTACK
            .onAppear {
                load()
            }
        } //: NavigationView
        .navigationTitle("Landmarks")
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
