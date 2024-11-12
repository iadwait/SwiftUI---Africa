//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
    //            .cornerRadius(12)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(animal.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.footnote)
                    .fontWeight(.regular)
                    .padding(.trailing, 8)
            }
        }
        .padding(4)
        //.background(.red)
        //.cornerRadius(10)
    }
}

#Preview {
    List {
        let arrAnimals: [AnimalModel] = AppUtils.shared.getAnimalsData()
        let animal: AnimalModel = arrAnimals[2]
        AnimalListItemView(animal: animal)
    }
}
