//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Adwait Barkale on 06/11/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://www.wikipedia.org")!, label: {
                        Text(animal.name)
                    })
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

//#Preview {
//    ExternalWebLinkView()
//}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let arrAnimals: [AnimalModel] = AppUtils.shared.getAnimalsData()
            ExternalWebLinkView(animal: arrAnimals[0])
        }
    }
}
