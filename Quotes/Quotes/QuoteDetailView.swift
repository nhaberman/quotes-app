//
//  QuoteDetailView.swift
//  Quotes
//
//  Created by Nick Haberman on 2/18/24.
//

import SwiftUI
import AVFoundation

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
                let utterance = AVSpeechUtterance(string: quote.getQuoteForSpeech())
                utterance.voice = VoiceUtilities.getBestAvailableVoice()
                utterance.rate = 0.5
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
