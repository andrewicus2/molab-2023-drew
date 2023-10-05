import SwiftUI

struct StateTesting: View {
    @State private var tapCount = 0
    @State private var name = ""

    
    var body: some View {
        
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}

#Preview {
    StateTesting()
}
