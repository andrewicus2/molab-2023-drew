//
//  Projects.swift
//  NavigationApp
//
//  Created by itpstudent on 10/11/23.
//  Copyright © 2023 itpstudent. All rights reserved.
//

import SwiftUI



struct Projects: View {
    private var projectNames = ["Here.fm", "Nessle", "Mindful Moment"]
    
    
    var body: some View {
        HStack {
            List {
                VStack {
                    Image("project-1")
                        .resizable()
                        .frame(height: 150)
                        .clipShape(Rectangle())
                        .cornerRadius(20)
                    Text("Here.fm")
                }
                VStack {
                    Image("project-2")
                        .resizable()
                        .frame(height: 150)
                        .clipShape(Rectangle())
                        .cornerRadius(20)
                    Text("Nessle")

                }
                VStack {
                    Image("project-3")
                        .resizable()
                        .frame(height: 150)
                        .clipShape(Rectangle())
                        .cornerRadius(20)
                    Text("Mindful Moment")
                }
            }
        }
        .navigationBarTitle("Projects")
    }
}




struct Projects_Previews: PreviewProvider {
    static var previews: some View {
        Projects()
    }
}
