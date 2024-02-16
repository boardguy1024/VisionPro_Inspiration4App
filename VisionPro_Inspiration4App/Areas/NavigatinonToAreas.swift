//
//  NavigatinonToAreas.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import SwiftUI

struct NavigatinonToAreas: View {
    var body: some View {
        VStack {
            
            Text("Welcome To The Inspiration 4 Mission By SpaceX")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 250)
            
            
            HStack(spacing: 25) {
                ForEach(AreaType.allCases) { type in
                    NavigationLink {
                        Text(type.title)
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                        
                        switch type {
                        case .astronauts:
                            CrewAreaView()
                        case .equipment:
                            EquipmentArea()
                        case .mission:
                            Text("")
                        
                        }
                    } label: {
                        Label(type.name, systemImage: "chevron.right")
                            .font(.title)
                    }
                }
                .controlSize(.extraLarge)
            }
        }
        .background {
            Image("Inspiration4")
        }
    }
}

#Preview {
    NavigatinonToAreas()
}
