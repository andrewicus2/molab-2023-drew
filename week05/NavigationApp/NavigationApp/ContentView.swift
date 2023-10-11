//
//  ContentView.swift
//  NavigationApp
//
//  Created by itpstudent on 10/11/23.
//  Copyright © 2023 itpstudent. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
        List {
            NavigationLink(destination: AboutMe()) {
                Text("About Me")
            }
            NavigationLink(destination: Projects()) {
                Text("My Projects")
            }
            NavigationLink(destination: SettingsRecreation()) {
                Text("Settings Recreation")
            }
        }
    .navigationBarTitle("Drew's App")
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
