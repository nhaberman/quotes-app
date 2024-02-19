//
//  QuoteDetailView.swift
//  Quotes
//
//  Created by Nick Haberman on 2/18/24.
//

import SwiftUI
import AVFoundation
import Foundation

struct QuoteDetailView: View {
    
    var quote: Quote
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        List {
            Section() {
                Text(quote.quoteText)
                    .font(.headline)
                    .padding()
            }
            Section("Time") {
                VStack(content: {
                    Text(quote.quoteTime, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
                        
                })
            }
//            Section("Tags") {
//                List {
//                    // add here when Tags are a custom type, that are identifiable
//                }
//            }
            Button {
                print("speak")
                
                let formatter = DateFormatter()
                formatter.dateStyle = .short
                formatter.timeStyle = .none
                let quoteDate = formatter.string(from: quote.quoteTime)
                
                let utterance = AVSpeechUtterance(string: "\(quote.quoteText), \(quoteDate)")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                utterance.rate = 0.5
                
                for availableVoice in AVSpeechSynthesisVoice.speechVoices() {
                    
                    
                    
                    print(availableVoice.name)
                }
                
                synthesizer.speak(utterance)
                
            } label: {
                Label("Speak", systemImage: "speaker.wave.2.bubble")
            }
        }
    }
}

#Preview {
    QuoteDetailView(quote: Quote(quoteText: "\"This is a sample quote.\"", quoteTime: Date()))
}
