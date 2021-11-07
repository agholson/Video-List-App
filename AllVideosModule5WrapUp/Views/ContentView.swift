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
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading, spacing: 20) {
                Text("All Videos")
                    .font(.title)
                
                // MARK: - Video List
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        // Loop through videos here 
                        ForEach(model.videos) { video in
                            
                            NavigationLink {
                                VideoView()
                                    .onAppear {
                                        model.setCurrentVideo(videoId: video.id)
                                    }
                            } label: {
                                Text(video.title)
                                    .padding(.bottom, 5)
                            }
                            .tint(.black)
                            
                            // Horizontal divider
                            Divider()

                        }
                        
                    }
                    
                }
                
            }
            
        }
        .padding()
        .navigationViewStyle(.stack)
        
    }
}
