//
//  ContentView.swift
//  P13_Instafilter_2024
//
//  Created by  Ty Vaughan on 3/19/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct ContentView: View {
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview

    @State private var selectedItem: PhotosPickerItem?
    @State private var processedImage: Image?

    // Filter properties
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var filterIntensity: Double = 0.5
    @State private var filterRadius: Double = 200
    @State private var filterScale: Double = 10
    @State private var showingFilters = false
    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                VStack {
                    if currentFilter.inputKeys.contains(kCIInputIntensityKey) {
                        HStack {
                            Text("Intensity")
                            Slider(value: $filterIntensity, in: 0...1)
                                .onChange(of: filterIntensity, applyProcessing)
                                .disabled(selectedItem == nil)
                        }
                    }
                    if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
                        HStack {
                            Text("Radius")
                            Slider(value: $filterRadius, in: 0...1000)
                                .onChange(of: filterRadius, applyProcessing)
                                .disabled(selectedItem == nil)
                        }
                    }
                    if currentFilter.inputKeys.contains(kCIInputScaleKey) {
                        HStack {
                            Text("Scale")
                            Slider(value: $filterScale, in: 0...100)
                                .onChange(of: filterScale, applyProcessing)
                                .disabled(selectedItem == nil)
                        }
                    }
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change filter", action: changeFilter)
                        .disabled(selectedItem == nil)

                    Spacer()
                    
                    if let processedImage {
                        ShareLink(
                            item: processedImage,
                            preview: SharePreview("Instafilter image", image: processedImage)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Guassian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Glass Distortion") { setFilter(CIFilter.glassDistortion()) }
                Button("Hexagon Pixellate") { setFilter(CIFilter.hexagonalPixellate()) }
                Button("Palettize") { setFilter(CIFilter.palettize()) }
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    func loadImage() -> Void {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)

            applyProcessing()
        }
    }
    
    func applyProcessing() -> Void {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
    func changeFilter() -> Void {
        showingFilters = true
    }
    
    @MainActor
    func setFilter(_ filter: CIFilter) -> Void {
        currentFilter = filter
        loadImage()
        filterCount += 1
        if filterCount >= 5 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
