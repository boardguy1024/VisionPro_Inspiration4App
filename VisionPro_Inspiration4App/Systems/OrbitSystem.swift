//
//  OrbitSystem.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/17.
//

import SwiftUI
import RealityKit

struct OrbitComponent: Component {
    var radius: Float
    var speed: Float
    var angle: Float
    var addOrientationRotation: Bool
    
    init(radius: Float = 2.0, speed: Float = 1.0, angle: Float = 0, addOrientationRotation: Bool) {
        self.radius = radius
        self.speed = speed
        self.angle = angle
        self.addOrientationRotation = addOrientationRotation
    }
}

struct OrbitSystem: System {
    
    static let query = EntityQuery(where: .has(OrbitComponent.self))
    
    init(scene: RealityKit.Scene) { }
    
    func setOrientation(context: SceneUpdateContext, entity: Entity, component: OrbitComponent) {
        let orientation = simd_quatf(angle: component.speed * Float(context.deltaTime), axis: [0, 1, 0])
        entity.setOrientation(orientation, relativeTo: entity)
    }
    
    func update(context: SceneUpdateContext) {
                
        for entity in context.entities(matching: Self.query, updatingSystemWhen: .rendering) {
            
            guard var component = entity.components[OrbitComponent.self] else { continue }
        
            if component.radius == 0 {
                setOrientation(context: context, entity: entity, component: component)

            } else {
                
                if component.addOrientationRotation {
                    setOrientation(context: context, entity: entity, component: component)
                }
                
                let x = component.radius * cos(component.angle)
                let z = component.radius * sin(component.angle)
                
                entity.transform.translation = SIMD3(x, 0, z)
                
                component.angle += component.speed * Float(context.deltaTime)
                
                entity.components.set(component)
            }
        }
    }
}
