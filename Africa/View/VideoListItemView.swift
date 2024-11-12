//
//  VideoListItemView.swift
//  Africa
//
//  Created by Adwait Barkale on 06/11/24.
//

import SwiftUI

struct VideoListItemView: View {
    
    let video: VideoModel
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail) // Computed Property
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(9)
                    .frame(width: 90, height: 90, alignment: .leading)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
            }
            
            VStack(alignment: .leading , spacing: 4) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

//#Preview {
//    List {
//        VideoListView()
//    }
//}

struct VideoListItem_Previews: PreviewProvider {
    static var previews: some View {
        List {
            let arrVideoData: [VideoModel] = AppUtils.shared.getVideoData()
            VideoListItemView(video: arrVideoData[0])
        }
    }
}
