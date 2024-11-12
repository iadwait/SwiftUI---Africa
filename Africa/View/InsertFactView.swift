//
//  InsertFactView.swift
//  Africa
//
//  Created by Adwait Barkale on 05/11/24.
//

import SwiftUI

struct InsertFactView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsertFactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let arrAnimals: [AnimalModel] = AppUtils.shared.getAnimalsData()
            InsertFactView(animal: arrAnimals[0])
        }
    }
}
