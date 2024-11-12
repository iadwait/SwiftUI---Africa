//
//  MapView.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // Initialization and not Computed property, its a closure
    // Satte bcoz maps requires binding property to carry changes like zooming, changing locations etc.
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [LocationModel] = AppUtils.shared.getLocationData()
    
    var body: some View {
        ZStack {
            // MARK 1 - BASIC MAP
            //Map(coordinateRegion: $region)
            
            // MARK 2 - ADVANCED MAP with Annotations
            Map(coordinateRegion: $region, annotationItems: locations) { item in
                // (A) PIN: Old Style (Always Static)
                //MapPin(coordinate: item.location, tint: .accent)
                
                // (B) MARKER: NEW Style (always static)
                //MapMarker(coordinate: item.location, tint: .accent)
                
                // (C) CUSTOM BASIC ANNOTATION (It could be interactive)
//                MapAnnotation(coordinate: item.location) {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32, alignment: .center)
//                }
                
                // (D) CUSTOM ADVANCED ANNOTATION (it could be interactive)
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            } //: MAP
            .overlay(
                VStack { // Older versions without VStack alignment top used to work
                    HStack(alignment: .center, spacing: 12) {
                        Image("compass")
                            .resizable()
                            .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                        
                        VStack(alignment: .leading, spacing: 3, content: {
                            HStack {
                                Text("Latitude:")
                                    .font(.system(size: 18, weight: .bold, design: .default))
                                    .foregroundStyle(.accent)
                                Spacer()
                                Text("\(region.center.latitude)")
                            }
                            HStack {
                                Text("Longitude:")
                                    .font(.system(size: 18, weight: .bold, design: .default))
                                    .foregroundStyle(.accent)
                                Spacer()
                                Text("\(region.center.longitude)")
                            }
                        })
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .cornerRadius(8)
                            .opacity(0.6)
                    )
                    //.background(.black).opacity(0.6) // This code will make entire element's opacity to 0.6 so we used above code
                .padding()
                }
                , alignment: .topLeading
            )
            
            
//            Alternative
//            VStack {
//                HStack {
//                    Text("Lat Long View")
//                        .foregroundColor(.white)
//                        .padding(10)
//                        .cornerRadius(8)
//                        .padding([.top, .leading], 20) // Padding for positioning it at top-left
//                    Spacer()
//                }
//                .frame(width: .infinity, height: 100)
//                .background(Color.black.opacity(0.7))
//                Spacer()
//            }
            .padding()
        }
    }
    
}

#Preview {
    MapView()
}
