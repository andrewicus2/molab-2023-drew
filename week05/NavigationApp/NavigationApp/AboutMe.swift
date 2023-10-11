//
//  AboutMe.swift
//  NavigationApp
//
//  Created by itpstudent on 10/11/23.
//  Copyright © 2023 itpstudent. All rights reserved.
//

import SwiftUI

struct AboutMe: View {
    var body: some View {
        VStack{
            HStack{
                Image("drew-headshot")
                    .resizable()
                    .frame(width: 150, height: 150)
                VStack {
                    Text("Drew Brown")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("Junior, NYU IMA")
                        .multilineTextAlignment(.leading)
                    Text("arb837@nyu.edu")
                }
            }
            Spacer()
        }
        .navigationBarTitle("About Me")
    }
}

struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMe()
    }
}
