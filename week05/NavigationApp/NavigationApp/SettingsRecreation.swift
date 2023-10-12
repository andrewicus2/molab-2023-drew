//
//  SettingsRecreation.swift
//  NavigationApp
//
//  Created by itpstudent on 10/11/23.
//  Copyright © 2023 itpstudent. All rights reserved.
//



import SwiftUI

struct SettingsRecreation: View {
    
    @State private var airplaneMode = false

    var body: some View {
        List {
            Section {
                NavigationLink(destination: Text("User Name")) {
                    HStack {
                        Image("memoji-2")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Test User")
                                .font(.system(size: 24))
                            Text("Apple ID, iCloud+, Media & Purchases")
                                .font(.caption)
                        }
                        .padding(.leading, 10.0)
                    }
                }
                NavigationLink(destination: Text("Family")) {
                    HStack {
                        HStack(spacing: -10){
                            Image("memoji-1")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .background(Color.white)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                            Image("memoji-4")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .background(Color(red: 0.35,green: 0.35, blue: 0.82))
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                            Image("memoji-3")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .background(Color.white)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                        }
                        
                        Text("Family")
                    }
                }
                NavigationLink(destination: Text("Update Apple ID Settings")) {
                    HStack{
                        Text("Update Apple ID Settings")
                        Spacer()
                        Text("1")
                            .frame(width: 26, height: 26)
                            .background(Color.red)
                            .clipShape(Circle())
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 10.0)
                }
            }
            Section{
                HStack {
                    ZStack{
                        Rectangle()
                            .fill(Color.orange)
                            .frame(width: 28, height: 28)
                            .cornerRadius(5)
                        Image(systemName: "airplane")
                            .foregroundColor(Color.white)
                    }
                    Toggle(isOn: $airplaneMode) {
                        Text("Airplane Mode")
                    }
                }
                NavigationLink(destination: Text("Wi-Fi")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "wifi")
                                .foregroundColor(Color.white)
                        }
                        Text("Wi-Fi")
                        Spacer()
                        Text("nyu")
                            .foregroundColor(.secondary)
                    }
                }
                
                NavigationLink(destination: Text("Bluetooth")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.white)
                        }
                        Text("Bluetooth")
                        Spacer()
                        Text("On")
                            .foregroundColor(.secondary)
                    }
                }
                
                NavigationLink(destination: Text("Cellular")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "phone.fill")
                                .foregroundColor(Color.white)
                        }
                        Text("Cellular")
                    }
                }
                
                NavigationLink(destination: Text("Personal Hotspot")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "link")
                                .foregroundColor(Color.white)
                        }
                        Text("Personal Hotspot")
                    }
                }
            }
            
            Section {
                NavigationLink(destination: Text("Notifications")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "bell.fill")
                                .foregroundColor(Color.white)
                        }
                        Text("Notifications")
                    }
                }
                
                NavigationLink(destination: Text("Sounds & Haptics")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.pink)
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "speaker.2.fill")
                                .foregroundColor(Color.white)
                        }
                        Text("Sounds & Haptics")
                    }
                }
                
                NavigationLink(destination: Text("Focus")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color(red: 0.35,green: 0.35, blue: 0.82))
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "moon.fill")
                                .foregroundColor(Color.white)
                        }
                        Text("Focus")
                    }
                }
                
                NavigationLink(destination: Text("Screen Time")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color(red: 0.35,green: 0.35, blue: 0.82))
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "timer")
                                .foregroundColor(Color.white)
                        }
                        Text("Screen Time")
                    }
                }
            }
            
            Section {
                NavigationLink(destination: General()) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "gear")
                                .foregroundColor(Color.white)
                        }
                        Text("General")
                    }
                }
                
                NavigationLink(destination: Text("Control Center")) {
                    HStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 28, height: 28)
                                .cornerRadius(5)
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(Color.white)
                        }
                        Text("Control Center")
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Settings")
    }
}

struct General: View {
    var body: some View {
        List {
            Section {
                NavigationLink(destination: About()) {
                    Text("About")
                }
                Text("Software Update")
            }
            Section {
                Text("AirDrop")
                Text("AirPlay & Handoff")
                Text("Picture in Picture")
                Text("CarPlay")
            }
            Section {
                Text("iPhone Storage")
                Text("Background App Refresh")
            }
            Section {
                Text("Date & Time")
                Text("Keyboard")
                Text("Fonts")
                Text("Language & Region")
                Text("Dictionary")

            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("General", displayMode: .inline)
    }
}

struct About: View {
    @State var deviceName = "Default Name"

    
    var body: some View {
        Form {
            Section {
                NavigationLink(destination: EditName(deviceName: $deviceName)){
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(deviceName)
                            .foregroundColor(Color.secondary)
                    }
                }
                HStack {
                    Text("iOS Version")
                    Spacer()
                    Text("13.2.3")
                        .foregroundColor(Color.secondary)
                }
                HStack {
                    Text("Model Name")
                    Spacer()
                    Text("iPhone SE (2nd Generation)")
                        .foregroundColor(Color.secondary)
                }
                Text("Model Number")
            }
        }
    .navigationBarTitle("About")
    }
}


struct EditName: View {
    
    @Binding var deviceName: String


    var body: some View {
        Form {
            TextField(
              "Device Name",
              text: $deviceName
            )
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
        }
            
    .navigationBarTitle("Name")
    }
}

struct SettingsRecreation_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRecreation()
    }
}
