//
//  InsertGalleryView.swift
//  Africa
//
//  Created by Adwait Barkale on 05/11/24.
//

import SwiftUI

struct InsertGalleryView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

//#Preview {
//    InsertGalleryView()
//}

struct InsertGalleryView_Previews: PreviewProvider {
  static var previews: some View {
      NavigationView {
          let arrAnimals: [AnimalModel] = AppUtils.shared.getAnimalsData()
          InsertGalleryView(animal: arrAnimals[0])
      }
  }
}
