//
//  FullRocketRealityAreaView.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FullRocketRealityAreaView: View {
    
    @State private var audioController: AudioPlaybackController?
    
    var body: some View {
        RealityView { content in
            guard let entity = try? await Entity(named: "Immersive", in: realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            
            let ambientAudioEntity = entity.findEntity(named: "AmbientAudio")
            
            guard let resource = try? await AudioFileResource(named: "/Root/Space_wav", from: "Immersive.usda", in: realityKitContentBundle) else {
                fatalError("Unable to find space.wav file")
            }
            
            ambientAudioEntity?.ambientAudio?.gain = -20
            audioController = ambientAudioEntity?.prepareAudio(resource)
    
            audioController?.play()
            
            content.add(entity)
        }
        .onDisappear {
            audioController?.stop()
        }
    }
}

#Preview {
    FullRocketRealityAreaView()
        .environmentObject(ViewModel())
}
