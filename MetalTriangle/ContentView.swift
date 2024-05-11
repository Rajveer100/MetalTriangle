//
//  ContentView.swift
//  MetalTriangle
//
//  Created by Rajveer Singh on 11/05/24.
//

import SwiftUI
import MetalKit

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            MetalView()
                .aspectRatio(1.0, contentMode: .fit)
        }
    }
}

#Preview {
    ContentView()
}
