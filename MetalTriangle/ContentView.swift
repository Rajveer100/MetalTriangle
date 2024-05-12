//
//  ContentView.swift
//  MetalTriangle
//
//  Created by Rajveer Singh on 11/05/24.
//

import SwiftUI
import MetalKit

struct ContentView: View {
    @State private var rotation: Float = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            MetalView(rotation: $rotation)
                .aspectRatio(1.0, contentMode: .fit)
            Spacer()
            
            Text("Rotation")
            HStack {
                Text("-π")
                Slider(value: $rotation, in: -(.pi)...(.pi))
                Text("π")
            }
            .padding()
            Spacer()
            
            Button("Reset") {
                rotation = 0.0
            }
        }
        .onChange(of: rotation) { oldValue, newValue in
            print("Slider value changed from \(oldValue) to \(newValue)")
        }
    }
}

#Preview {
    ContentView()
}
