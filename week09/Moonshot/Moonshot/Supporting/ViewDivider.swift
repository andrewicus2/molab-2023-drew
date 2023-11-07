//
//  ViewDivider.swift
//  Moonshot
//
//  Created by drew on 11/6/23.
//

import SwiftUI

struct ViewDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    ViewDivider()
}
