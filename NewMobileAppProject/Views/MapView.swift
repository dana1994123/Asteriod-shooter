//
//  MapView.swift
//  NewMobileAppProject
//
//  Created by Ryan Haire on 2021-12-08.
//

import SwiftUI
import MapKit

// maplocation object
struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct MapView: View {
    
    // map location
    let MapLocations = [
            MapLocation(name: "Sheridan College Trafalgar Campus", latitude: 43.468601, longitude: -79.700432)
    ]
    
    // region for the location
    @State private var region: MKCoordinateRegion =  MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 43.468601, longitude: -79.700432), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) )
    
    var body: some View {
        ZStack {
            // background image
            Image("bg").resizable().resizable().edgesIgnoringSafeArea(.all)
            
            VStack {
                // title
                Text("Our Game Development Office")
                    .padding()
                    .font(Font.largeTitle.weight(.bold))
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    
                    
                // map and map pin 
                Map(coordinateRegion: $region, annotationItems: MapLocations) { item in
                    MapAnnotation(coordinate: item.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                        Circle()
                            .strokeBorder(Color.red, lineWidth: 10)
                            .frame(width: 44, height: 44)
                        Text(item.name)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
            .navigationBarHidden(true)
            
        }
        
       
    }
}

