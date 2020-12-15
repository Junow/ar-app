//
//  ContentView.swift
//  ar-app
//
//  Created by junow on 2020/12/15.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return VStack {
            Text("123")
            ARViewContainer().edgesIgnoringSafeArea(.all)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let boxAnchor = try! Experience.loadBox();
        boxAnchor.steelBox?.scale = SIMD3(5,5,5);
        boxAnchor.steelBox?.orientation = simd_quatf(angle: Float.pi/4,axis: SIMD3(1,1,0))
        
        arView.backgroundColor = .orange
        arView.scene.anchors.append(boxAnchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
