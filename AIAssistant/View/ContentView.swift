//
//  ContentView.swift
//  AIAssistant
//
//  Created by Brenda Saavedra Cantu on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: View Properties
    @State var vm = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

//MARK: - Previews
#if DEBUG
#Preview("Idle") {
    ContentView()
}

#Preview("Recording Speech") {
    let vm = ViewModel()
    vm.state = .recordingSpeech
    return ContentView(vm: vm)
}

#Preview("Processing Speech") {
    let vm = ViewModel()
    vm.state = .processingSpeech
    return ContentView(vm: vm)
}

#Preview("Playing Speech") {
    let vm = ViewModel()
    vm.state = .playingSpeech
    return ContentView(vm: vm)
}

#Preview("Error") {
    let vm = ViewModel()
    vm.state = .error("An error has ocurred :(")
    return ContentView(vm: vm)
}
#endif
