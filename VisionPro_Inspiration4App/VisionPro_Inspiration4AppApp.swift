//
//  VisionPro_Inspiration4AppApp.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import SwiftUI

@main
struct VisionPro_Inspiration4AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
