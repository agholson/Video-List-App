//
//  VideoView.swift
//  AllVideosModule5WrapUp
//
//  Created by Shepherd on 11/6/21.
//

import SwiftUI

struct VideoView: View {
    
    @EnvironmentObject var model: VideoModel
    
    var body: some View {
        Text(model.currentVideo?.title ?? "")
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
