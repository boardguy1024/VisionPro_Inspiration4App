//
//  Crew.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import Foundation

enum Crew: String, Identifiable, CaseIterable, Equatable {
    case jared, haley, chris, sian
    
    var id: Self { self }
    
    var name: String { rawValue.lowercased() }
    
    var fullname: String {
        switch self {
        case .jared:
            "Jared Isaaman"
        case .haley:
            "Haley Arcenuaux"
        case .chris:
            "Chris Sembroski"
        case .sian:
            "Dr. Sian Proctor"
        }
    }
    
    var about: String {
        switch self {
        case .jared:
            "Jared Isaacman is the founder and CEO of Shift4 Payments (NYSE: FOUR), the leader in integrated payment processing solutions."
        case .haley:
            "When Hayley was 10 years old, one of her knees began to ache. Her doctor thought it was just a sprain, but a few months later, tests revealed Hayley suffered from osteosarcoma, a type of bone cancer. Her family turned to St. "
        case .chris:
            "Chris Sembroski grew up with a natural curiosity about outer space. Stargazing late at night on the roof of his high school and launching high-powered model rockets in college cemented this passion. "
        case .sian:
            "Dr. Sian Proctor is a geoscientist, explorer, and science communication specialist with a lifelong passion for space exploration. "
        }
    }
}
