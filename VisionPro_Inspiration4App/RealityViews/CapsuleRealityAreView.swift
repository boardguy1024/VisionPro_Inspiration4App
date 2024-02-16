//
//  CapsuleRealityAreView.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CapsuleRealityAreView: View {
    var body: some View {
        RealityView { content in
            guard let entity = try? await Entity(named: "Scene", in: realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            content.add(entity)
        }
    }
}

#Preview {
    CapsuleRealityAreView()
        .environmentObject(ViewModel())
}
