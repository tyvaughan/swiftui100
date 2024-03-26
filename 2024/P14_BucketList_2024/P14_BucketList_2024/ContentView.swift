//
//  ContentView.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/22/24.
//

import MapKit
import _MapKit_SwiftUI
import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        if viewModel.isUnlocked {
            ZStack {
                MapReader { proxy in
                    Map(initialPosition: startPosition, interactionModes: [.pan, .zoom]) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 32, height: 32)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    .mapStyle(viewModel.mapStyleValue)
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        LocationEditView(location: place, onSave: viewModel.saveLocation)
                    }
                }
                
                
                VStack {
                    HStack {
                        Spacer()
                        Picker("Map style", selection: $viewModel.mapStyle) {
                            Image(systemName: "map").tag("imagery")
                            Image(systemName: "road.lanes").tag("standard")
                        }
                        .pickerStyle(.segmented)
                    }
                    Spacer()
                }
                
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
                    // no actions
                } message: {
                    Text(viewModel.alertMessage)
                }
        }
    }

}

#Preview {
    ContentView()
}
