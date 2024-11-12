//
//  VideoListView.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [VideoModel] = AppUtils.shared.getVideoData()
    // Haptic are used to give better UI Experience like on tap vibrate to be tested on real device
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoName: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                    }
                }
            }
            .navigationBarTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        }
    }
}

#Preview {
    VideoListView()
}
