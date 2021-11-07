//
//  VideoModel.swift
//  AllVideosModule5WrapUp
//
//  Created by Shepherd on 11/6/21.
//

import Foundation

class VideoModel: ObservableObject {
    
    @Published var videos = [Video]()
    
    // Tracks our current video
    @Published var currentVideo: Video?
    var currentVideoIndex = 0
    
    init() {
        
        // Get the videos here
        getVideos()
        
    }
    
    /*
     Fetches JSON that defines our list of Videos, then decodes the fetched json into the
     list of Video objects
     */
    func getVideos() {
        
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        
        // Create a URL object
        let url = URL(string: urlString)
        
        // Make sure the URL exists, so we can safely unwrap it below
        guard url != nil else {
            return
        }
        
        // Create a URL request object
        let request = URLRequest(url: url!)
        
        // Create a session to do network tasks
        let session = URLSession.shared
        
        // Create a dataTask to execute this request
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            // Check if it hit any errors
            guard error == nil else {
                return
            }
            
            // Handle the response data
            do {
                let decoder = JSONDecoder()
                
                // Decode the videos into a list of the Video structures from the returned data
                let videos = try decoder.decode([Video].self, from: data!)
                
                // Update the videos for the videoModel
                DispatchQueue.main.async {
                    self.videos += videos
                }
                
            }
            catch {
                print("Failed to decode the JSON line 58 ViewModels.VideoModel.getVideos")
            }
            
        }
        
        // Issue the GET request to grab the videos here
        dataTask.resume()
        
    }
    
    func setCurrentVideo(videoId: Int) {
        
        // Loop through all of our videos via their indexes, because a video might have a different ID than its index
        for index in 0..<videos.count {
            if videos[index].id == videoId {
                // Means this current index is the one we want
                currentVideoIndex = index
                
                // Set the current video to this
                currentVideo = videos[index]
                
                break
                
            }
        }
       
    }
    
}
