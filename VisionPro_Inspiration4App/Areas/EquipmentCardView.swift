//
//  EquipmentCardView.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import SwiftUI

struct EquipmentCardView: View {
    
    @Binding var isShowing: Bool
    let toggleTitle: String
    let imageName: String
    let openCard: () async -> Void
    let dismissCard: () async -> Void
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 300, height: 300)
                .padding(20)
            
            Button {
                isShowing.toggle()
            } label: {
                Text("\(isShowing ? "Hide \(toggleTitle)" : "Show \(toggleTitle)")")
            }
        }
        .onChange(of: isShowing, { _, isShowing in
            Task {
                if isShowing {
                    await openCard()
                } else {
                    await dismissCard()
                }
            }
        })
        .padding()
        .glassBackgroundEffect()
    }
}
