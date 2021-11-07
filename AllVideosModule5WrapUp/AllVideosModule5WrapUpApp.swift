//
//  AllVideosModule5WrapUpApp.swift
//  AllVideosModule5WrapUp
//
//  Created by Shepherd on 11/6/21.
//

import SwiftUI

@main
struct AllVideosModule5WrapUpApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(VideoModel())
        }
    }
}
