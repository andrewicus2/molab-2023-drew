//
//  AstronautChip.swift
//  Moonshot
//
//  Created by drew on 11/6/23.
//

import SwiftUI

struct AstronautChip: View {
    let crewMember: MissionView.CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(.capsule)
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .foregroundStyle(.white)
                    .font(.headline)
                
                Text(crewMember.role)
                    .foregroundStyle(.white.opacity(0.5))
            }
        }
    }
}
