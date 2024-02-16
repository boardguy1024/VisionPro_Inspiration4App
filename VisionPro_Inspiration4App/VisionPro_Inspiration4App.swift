//
//  VisionPro_Inspiration4App.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import SwiftUI

@main
struct VisionPro_Inspiration4App: App {
    @State var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            AreasView()
                .environmentObject(viewModel)
        }
        
        WindowGroup(id: viewModel.capsuleRealityAreaId) {
            CapsuleRealityAreView()
                .environmentObject(viewModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        ImmersiveSpace(id: viewModel.fullRocketRealityArea) {
            FullRocketRealityAreaView()
                .environmentObject(viewModel)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
        
        ImmersiveSpace(id: viewModel.mixedRocketRealityArea) {
            FullRocketRealityAreaView()
                .environmentObject(viewModel)
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}
