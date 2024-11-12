//
//  ContentView.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGridViewActive: Bool = false
    let arrAnimals: [AnimalModel] = Bundle.main.decode("animals.json", parsingType: [AnimalModel].self)
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        print("gridLayout.count = \(gridLayout.count)")
        print("gridLayout.count % 3 + 1 = \(gridLayout.count % 3 + 1)")
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
            
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(arrAnimals) { item in
                            NavigationLink(destination: AnimalDetailView(animal: item)) {
                                AnimalListItemView(animal: item)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .listRowBackground(Color.clear)
                        }
                        
                        CopyrightsView()
                            .modifier(CenterModifier())
                            //.frame(maxWidth: .infinity, alignment: .center)
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        //VStack {
//                        Text("Click to view details")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .background(.red)
//                            .padding(.horizontal, 10)
                            LazyVGrid(columns: gridLayout, spacing: 10) {
                                ForEach(arrAnimals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                        AnimalGridItemView(animal: animal)
                                    }
                                }
                            }
                            .padding(10)
                        //}
                    }
                }//: List
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 2) {
                        // List
                        Button(action: {
                            print("List View is Activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title3)
                                .foregroundStyle(isGridViewActive ? .white : .accent)
                        })
                        // Grid
                        Button(action: {
                            print("Grid View is Activated")
                            isGridViewActive = true
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title3)
                                .foregroundStyle(isGridViewActive ? .accent : .white)
                        })
                        
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
