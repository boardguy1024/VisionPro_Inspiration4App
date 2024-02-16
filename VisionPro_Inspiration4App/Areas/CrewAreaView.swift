//
//  CrewAreaView.swift
//  VisionPro_Inspiration4App
//
//  Created by paku on 2024/02/16.
//

import SwiftUI

struct CrewAreaView: View {
    var body: some View {
        HStack {
            ForEach(Crew.allCases) { crew in
                VStack(alignment: .leading) {
                    Image("crew-\(crew.name)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 200)
                    Text(crew.fullname)
                        .font(.system(size: 22, weight: .bold))
                    Text(crew.about)
                        .font(.system(size: 20))

                }
                .padding(15)
                .glassBackgroundEffect()
            }
            .padding()
        }
        .padding(20)
    }
}

#Preview {
    CrewAreaView()
}
