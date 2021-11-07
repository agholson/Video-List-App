//
//  VideoView.swift
//  AllVideosModule5WrapUp
//
//  Created by Shepherd on 11/6/21.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    @EnvironmentObject var model: VideoModel
    
    var body: some View {
        
        // If the current video is not nil, then run this code
        if model.currentVideo != nil {
            
            // Get the URL for the video
            let url = URL(string: model.currentVideo!.url)
            
            VStack(alignment: .leading) {
                // MARK: - Title
                Text(model.currentVideo!.title)
                    .font(.title)
                
                // MARK: - Video
                // Make sure the url exits
                if url != nil {
                    // Create a video player to hold our video
                    VideoPlayer(player: AVPlayer(url: url!))
                        .frame(height: 250)
                }
                
                Spacer()
                
            }
            
        }
        // Else if it doesn't show yet
        else {
            ProgressView()
        }
        
        
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
