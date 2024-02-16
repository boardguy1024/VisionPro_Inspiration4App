//
//  ViewModel.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var navigationPath: [AreaType] = []
    @Published var isShowingRocketCapsule: Bool = false
    @Published var isShowingFullRocket: Bool = false
    @Published var isShowingMixedRocket: Bool = false

    var capsuleRealityAreaId: String = "CapsuleRealityAreaView"
    var fullRocketRealityArea: String = "FullRocketRealityAreaView"
    var mixedRocketRealityArea: String = "MixedRocketRealityAreaView"
}
