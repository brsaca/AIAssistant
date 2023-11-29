//
//  ViewModel.swift
//  AIAssistant
//
//  Created by Brenda Saavedra Cantu on 28/11/23.
//

import AVFoundation
import Foundation
import Observation
import XCAOpenAIClient

@Observable
final class ViewModel: NSObject {
    
    let client = OpenAIClient(apiKey: Config.openAIKey)
    
    var selectedVoice = VoiceType.alloy
    var state = VoiceChatState.idle {
        didSet {
            print(state)
        }
    }
    var isIdle: Bool {
        if case .idle = state {
            return true
        }
        return false
    }
    var audioPower = 0.0
    
    func startCaptureAudio() {
        
    }
}
