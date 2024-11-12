//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Adwait Barkale on 06/11/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoName: String
    var videoTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if let avPlayer = playVideo(fileName: videoName, fileFormat: "mp4") {
                VideoPlayer(player: avPlayer) {
                    //Text("Lion")
                }
                .overlay (
                    VStack(alignment: .leading) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .padding()
                        
                        Spacer()
                    },
                alignment: .topLeading
                )
            } else {
                Text("Unable to load video")
            }
        }
        .navigationBarTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        VideoPlayerView(videoName: "cheetah", videoTitle: "Cheetah")
    }
}
