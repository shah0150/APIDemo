//
//  SwiftUIMapKit.swift
//  APIDemo
//
//  Created by Adesh Shah on 2023-10-12.
//

import SwiftUI
import MapKit

struct SwiftUIMapKit: View {
    
    @State var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    @State var searchText = ""
    
    @State  var results = [MKMapItem]()
    
    @State var mapSelection: MKMapItem?
    
    var body: some View {
        
        Map(position: $cameraPosition, selection: $mapSelection){
            Annotation("My Location", coordinate: .userLocation) {
                ZStack{
                    Circle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundStyle(.blue.opacity(0.25))
                }
            }
            
            ForEach(results, id: \.self){
                item in
                let placemark = item.placemark
                Marker(placemark.name ?? "", coordinate: placemark.coordinate)
            }
        }
        .overlay(alignment: .top){
            TextField("Search for location", text: $searchText)
                .font(.subheadline)
                .padding(12)
                .background(.white)
                .padding()
                .shadow(radius: 10)
                .cornerRadius(3)
        }.onSubmit(of: /*@START_MENU_TOKEN@*/.text/*@END_MENU_TOKEN@*/) {
            Task {
                await searchPlaces()
            }
        }
        .mapControls {
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
        }
    }
}

extension SwiftUIMapKit{
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = .userRegion
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D{
        return .init(latitude: 45.424721,
                     longitude: -75.695000)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion{
        return .init(center: .userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}

#Preview {
    SwiftUIMapKit()
}
