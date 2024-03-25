//
//  IntegratingMapKit.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/22/24.
//

import MapKit
import SwiftUI

struct IntegratingMapKit: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    var locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        VStack {
            
            // MapReader allows us to read in gestures from the user
            MapReader { proxy in
                
                // Map lets us create a map
                Map(position: $position, interactionModes: [.pan, .zoom]) {
                    ForEach(locations) { location in
                        
                        // Marker uses a default balloon location pin from Apple
                        //Marker(location.name, coordinate: location.coordinate)
                        
                        // Annotation lets you use a totally custom view for location pins
                        Annotation(location.name, coordinate: location.coordinate) {
                            Text(location.name)
                                .font(.caption2)
                                .padding()
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                        .annotationTitles(.hidden)
                    }
                }
                .mapStyle(.standard)
                .onMapCameraChange { context in // update position when movement ends
                    print(context.region)
                }
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print(coordinate)
                    }
                }
            }

            // Map(position: $position, interactionModes: [.pan, .zoom])
            //     .mapStyle(.standard)
            //     .onMapCameraChange(frequency: .continuous) { context in // update position continuously
            //         print(context.region)
            //     }
    
            HStack {
                Button("Paris", action: focusParis)
                Button("Tokyo", action: focusTokyo)
                Button("London", action: focusLondon)
            }
        }
    }
    
    // MARK: Location methods

    func focusParis() -> Void {
        position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
    }
    
    func focusTokyo() -> Void {
        position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
    }
    
    func focusLondon() -> Void {
        position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
    }
    
    // MARK: Location struct
    
    struct Location: Identifiable {
        let id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
    }

}

#Preview {
    IntegratingMapKit()
}
