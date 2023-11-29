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
        VStack(spacing: 16) {
            Text("AI Voice Assistant")
                .font(.title2)
            
            switch vm.state {
            case .idle, .error:
                startCaptureButton
            default: EmptyView()
            }
            
            Picker("Select Voice", selection: $vm.selectedVoice) {
                ForEach(VoiceType.allCases, id: \.self) {
                    Text($0.rawValue).id($0)
                }
            }
            .pickerStyle(.segmented)
            .disabled(!vm.isIdle)
            
            if case let .error(error) = vm.state {
                Text(error.localizedDescription)
                    .foregroundStyle(.red)
                    .font(.caption)
                    .lineLimit(2)
            }
        }
        .padding()
    }
    
    var startCaptureButton: some View {
        Button {
            vm.startCaptureAudio()
        } label: {
            Image(systemName: "mic.circle")
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 128))
        }
        .buttonStyle(.borderless)
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
