//
//  Entity+Sunglight.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/17.
//

import RealityKit

extension Entity {
    func setSunlight(intensity: Float) {
        Task {
            guard let resource = try? await EnvironmentResource(named: "Sunlight") else { return }
            // ibl = ImageBasedLight イメージ基盤でのライト
            // .single or .blendがある
            // .single =  単一環境利リソースを光源として使用
            // .blend = 複数の環境リソースを光源として使用 コーヒーブレンドみたいなイメージ
            let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: intensity)
            
            // 1. sunlightのresourceを取得し、iblComponentのインスタンスを作成。
            // 2. target(self) Entityに iblComponentを追加
            components.set(iblComponent)
            // 3. tartget(self) は Entity自身が IBLの光をつけとることを設定
            // つまり、これを設定することで、Entityがライトを　受ける（反射する） ことが可能になる
            components.set(ImageBasedLightReceiverComponent(imageBasedLight: self))
        }
    }
}
