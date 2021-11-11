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
            VStack (alignment: .leading) {
                
                // MARK: - Search Bar
                SearchView(searchString: $searchText)
                    .padding(.bottom)
                
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
                            // Make them both lowercase so we ignore case
                            else if video.title.lowercased().contains(searchText.lowercased()) {
                                
                                VideoItemView(selectedVideo: video)
                            }

                        }
                        
                    }
                    
                }
                
                // Spacer to push everything up
                Spacer()
                
            }
                .padding(.horizontal)
            // Makes this the title of the current VStack
                .navigationTitle("All Videos")
//                .navigationBarTitleDisplayMode(.inline)  // Makes the navigationTitle display with less space
            
        }
            .navigationViewStyle(.stack)

    }
}

