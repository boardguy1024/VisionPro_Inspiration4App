//
//  EquipmentArea.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import SwiftUI

struct EquipmentArea: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    var body: some View {
        
        HStack(spacing: 40) {
            
            EquipmentCardView(isShowing: $viewModel.isShowingRocketCapsule,
                              toggleTitle: "Rocket Capsule (Volumetric)",
                              imageName: "equipment-capsule", openCard: {
                openWindow(id: viewModel.capsuleRealityAreaId)
            }, dismissCard: {
                dismissWindow(id: viewModel.capsuleRealityAreaId)
            })

            EquipmentCardView(isShowing: $viewModel.isShowingFullRocket,
                              toggleTitle: "Rocket (Full Immersive Space)",
                              imageName: "equipment-fullrocket", openCard: {
                await openImmersiveSpace(id: viewModel.fullRocketRealityArea)
            }, dismissCard: {
                await dismissImmersiveSpace()
            })
            
            EquipmentCardView(isShowing: $viewModel.isShowingMixedRocket,
                              toggleTitle: "Rocket (Mixed Immersive Space)",
                              imageName: "equipment-mixedrocket", openCard: {
                await openImmersiveSpace(id: viewModel.mixedRocketRealityArea)
            }, dismissCard: {
                await dismissImmersiveSpace()
            })
        }
    }
}

#Preview {
    EquipmentArea()
        .environmentObject(ViewModel())
}
