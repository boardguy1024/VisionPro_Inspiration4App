//
//  Area.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import Foundation

enum AreaType: String, Identifiable, CaseIterable, Equatable {
    case astronauts
    case equipment
    case mission
    
    var id: Self { self }
    var name: String { rawValue.lowercased() }
    
    var title: String {
        switch self {
        case .astronauts:
            "Inspiration 4 mission crew members..."
        case .equipment:
            "Inspiration 4 mission equipment..."
        case .mission:
            "Inspiration 4 mission trailer..."
        }
    }
}
