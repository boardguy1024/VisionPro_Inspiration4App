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
    @EnvironmentObject var viewModel: ViewModel
    @State private var capsule: Entity?
    let attachmentID = "attachmentID"

    var body: some View {
        RealityView { content, attachments in
            guard let entity = try? await Entity(named: "Scene", in: realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            content.add(entity)

            self.capsule = entity
            self.capsule?.setSunlight(intensity: 12.5)
            self.capsule?.components.set(OrbitComponent(radius: 0.02, speed: 0, addOrientationRotation: true))
            
            // RealityViewの下に用意した attachmentsを idでターケットAttachmentを取得し
            // 設定を行って、contentにaddする
            if let sceneAttachment = attachments.entity(for: attachmentID) {
                sceneAttachment.position = SIMD3<Float>(-0.2, -0.1, 0.1)
                
                // x軸を基準に -0.5度回す
                sceneAttachment.transform.rotation = simd_quatf(angle: -0.5, axis: SIMD3<Float>(1,0,0))
                content.add(sceneAttachment)
            }
        } update: { content, attachments in
            print("RealityView changes detected...")
            
        } placeholder: {
            // contentが表示までに表示されるViewなので 必ずしも ProgressViewでなくて良い
            ProgressView()
                .progressViewStyle(.circular)
                .controlSize(.large)
        } attachments: {
            // ここで、modelの近くに表示されるViewを 複数用意することができる
            
            Attachment(id: attachmentID){
                CapsuleControlView {
                    self.capsule?.setSunlight(intensity: 12.5)
                } turnOffLight: {
                    self.capsule?.setSunlight(intensity: 10)
                } turnOnOrbit: {
                    self.capsule?.components[OrbitComponent.self]?.speed = 1
                } turnOffOrbit: {
                    self.capsule?.components[OrbitComponent.self]?.speed = 0
                }
            }
            
            // Attachment(id: attachment1ID){ ... }
            // Attachment(id: attachment2ID){ ... }
            // Attachment(id: attachment3ID){ ... }
            // ...
        }
        .onDisappear {
            viewModel.isShowingRocketCapsule = false
        }
    }
}

#Preview {
    CapsuleRealityAreView()
        .environmentObject(ViewModel())
}
