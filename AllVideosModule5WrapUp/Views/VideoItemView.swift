//
//  VideoItemView.swift
//  AllVideosModule5WrapUp
//
//  Created by Shepherd on 11/7/21.
//

import SwiftUI

struct VideoItemView: View {
    
    @EnvironmentObject var model: VideoModel
    
    let selectedVideo: Video
    
    var body: some View {
        NavigationLink {
            VideoView()
                .onAppear {
                    model.setCurrentVideo(videoId: selectedVideo.id)
                }
        } label: {
            Text(selectedVideo.title)
                .padding(.bottom, 5)
        }
        .tint(.black)
        
        // Horizontal divider
        Divider()
    }
}

