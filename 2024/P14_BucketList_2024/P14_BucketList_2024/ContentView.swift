//
//  ContentView.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/22/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
    
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition, interactionModes: [.pan, .zoom]) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 32, height: 32)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                }
            }
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        addLocation(at: coordinate)
                    }
                }
                .sheet(item: $selectedPlace) { place in
                    LocationEditView(location: place, onSave: saveLocation)
                }
        }
    }
    
    func addLocation(at coordinate: CLLocationCoordinate2D) -> Void {
        let newLocation = Location(id: UUID(), name: "New location", description: "Description", latitude: coordinate.latitude, longitude: coordinate.longitude)
        locations.append(newLocation)
    }
    
    func saveLocation(_ location: Location) -> Void {
        if let index = locations.firstIndex(of: location) {
            locations.remove(at: index)
            locations.insert(location, at: index)
        }
    }
}

#Preview {
    ContentView()
}
