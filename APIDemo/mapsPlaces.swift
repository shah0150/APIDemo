//
//  mapsPlaces.swift
//  APIDemo
//
//  Created by Adesh Shah on 2023-10-12.
// 45.35032391452672, -75.75502897317173

import SwiftUI
import MapKit

let college = CLLocationCoordinate2D(latitude: 45.35032391452672, longitude: -75.75502897317173)
let hub350 = CLLocationCoordinate2D(latitude: 45.34039779085303, longitude: -75.90948046368617)
let parliament = CLLocationCoordinate2D(latitude: 45.42378928050986, longitude: -75.70100408776787)



struct mapsPlaces: View {
    @State var camera:  MapCameraPosition = .automatic
    var body: some View {
        Map(position: $camera) {
            Marker("Algonquin College", systemImage: "graduationcap.circle.fill", coordinate: college).tint(.green)
//            Marker("Hub350", coordinate: hub350)
            Annotation("Hub350", coordinate: hub350) {
                Image(systemName: "person.3.fill")
                    .padding().background(.red)
            }
            Marker("Parliament", coordinate: parliament)
        }.safeAreaInset(edge: .bottom) {
            HStack{
                Spacer()
                Button(action: {
                    // center
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                }).background(.thinMaterial)
            }
        }
    }
}

#Preview {
    mapsPlaces()
}
