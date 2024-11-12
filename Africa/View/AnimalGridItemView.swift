//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Adwait Barkale on 11/11/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFill()
            .cornerRadius(12)
    }
}

//#Preview {
//    let arrAnimal: [AnimalModel] = AppUtils.shared.getAnimalsData()
//    AnimalGridItemView(animal: arrAnimal[0])
//}

struct AnimalGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            let arrAnimal: [AnimalModel] = AppUtils.shared.getAnimalsData()
            AnimalGridItemView(animal: arrAnimal[0])
        }
    }
}
