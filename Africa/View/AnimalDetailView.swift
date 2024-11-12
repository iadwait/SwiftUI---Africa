//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center ,spacing: 20) {
                // Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .background( // Underline
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal)
                
                // Gallery
                Group { // SwiftUI has limitation of 10 views in 1 file which can be bypassed using group
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsertGalleryView(animal: animal)
                }
                .padding(.horizontal)
                    
                // Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know ?")
                    InsertFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "Learn about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // Map
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsertMapView()
                }
                .padding(.horizontal)
                
                // Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn more about")
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
            } // : VStack
            .navigationBarTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        } // : ScrollView
    }
}

//#Preview {
//    AnimalDetailView()
//}

struct AddContainer_Previews: PreviewProvider {
  static var previews: some View {
      NavigationView {
          let arrAnimals: [AnimalModel] = AppUtils.shared.getAnimalsData()
          AnimalDetailView(animal: arrAnimals[0])
      }
  }
}
