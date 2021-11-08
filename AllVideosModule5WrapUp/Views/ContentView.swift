//
//  ContentView.swift
//  AllVideosModule5WrapUp
//
//  Created by Shepherd on 11/6/21.
//

import SwiftUI

struct ContentView: View {
    
    // Inherits the VideoModel from the top-most view
    @EnvironmentObject var model: VideoModel
    
    // Tracks the text our user searches for
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading, spacing: 20) {
                // MARK: - Video Title
                Text("All Videos")
                    .font(.title)
                
                // MARK: - Search Bar
                SearchView(searchString: $searchText)
                
                
                // MARK: - Video List
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        // Loop through videos here 
                        ForEach(model.videos) { video in
                            
                            // If the search text is empty, then display everything
                            if searchText == "" {
                                // Displays the video with a title and divider line
                                VideoItemView(selectedVideo: video)
                            }
                            // Else if the video title contains the text searched for, then display it
                            else if video.title.contains(searchText) {
                                
                                VideoItemView(selectedVideo: video)
                            }

                        }
                        
                    }
                    
                }
                
                // Spacer to push everything up
                Spacer()
                
            }
            
        }
            .padding()
            .navigationViewStyle(.stack)
//            .navigationBarHidden(true)
//            .navigationTitle(Text("All Videos"))

    }
}
