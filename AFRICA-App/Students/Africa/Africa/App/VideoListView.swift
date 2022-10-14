//
//  VideoListView.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 05/10/2022.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - PROPERTIES
    @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(videos) { video in 
                VideoListItemView(video: video)
            } //: List
            .listStyle(.sidebar)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { 
                ToolbarItem(placement: .navigationBarTrailing) { 
                    Button { 
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: { 
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } //: NavigationView
    }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
