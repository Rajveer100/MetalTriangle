//
//  MetalView.swift
//  MetalTriangle
//
//  Created by Rajveer Singh on 12/05/24.
//

import SwiftUI
import MetalKit

struct MetalView {
    @State private var renderer: MetalRenderer = MetalRenderer()
    
    @Binding var rotation: Float
    
    private func makeMetalView() -> MTKView {
        let view = MTKView()
        
        view.clearColor = MTLClearColorMake(0.0, 0.0, 0.0, 1.0)
        
        view.device = renderer.device
        view.delegate = renderer
        
        return view
    }
    
    private func updateMetalView() {
        renderer.updateRotation(angle: rotation)
    }
}

#if os(iOS)
extension MetalView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        makeMetalView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        updateMetalView()
    }
}
#elseif os(macOS)
extension MetalView: NSViewRepresentable {
    func makeNSView(context: Context) -> some NSView {
        makeMetalView()
    }
    
    func updateNSView(_ uiView: NSViewType, context: Context) {
        updateMetalView()
    }
}
#endif
