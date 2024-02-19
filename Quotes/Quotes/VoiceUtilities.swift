//
//  VoiceUtilities.swift
//  Quotes
//
//  Created by Nick Haberman on 2/19/24.
//

import Foundation
import AVFoundation

class VoiceUtilities {
    
    static private var preferredVoices = ["Zoe", "Susan", "Samantha"]
    
    static func getBestAvailableVoice() -> AVSpeechSynthesisVoice! {

        // find all available voices
        let availableVoices = AVSpeechSynthesisVoice.speechVoices()
        
        // check if any premium voice exists
        for availableVoice in availableVoices.filter({ voice in
            voice.quality == .premium
        }) {
            if preferredVoices.contains(availableVoice.name.replacingOccurrences(of: " (Premium)", with: "")) {
                print("Using premium voice:  " + availableVoice.name)
                return availableVoice
            }
        }
        
        // next check if any enhanced voice exists
        for availableVoice in availableVoices.filter({ voice in
            voice.quality == .enhanced
        }) {
            if preferredVoices.contains(availableVoice.name.replacingOccurrences(of: " (Enhanced)", with: "")) {
                print("Using enhanced voice:  " + availableVoice.name)
                return availableVoice
            }
        }
        
        // finally check for any default voice exists
        print("Default Voices:")
        for availableVoice in availableVoices.filter({ voice in
            voice.quality == .default
        }) {
            if preferredVoices.contains(availableVoice.name) {
                print("Using default voice:  " + availableVoice.name)
                return availableVoice
            }
        }
        
        // if nothing was found, return the default voice for the language
        print("Using system default voice.")
        return AVSpeechSynthesisVoice(language: AVSpeechSynthesisVoice.currentLanguageCode())
    }
    
    static func printAllAvailableVoices() {
        // find all available voices
        let availableVoices = AVSpeechSynthesisVoice.speechVoices()

        // list premium voices
        print("Premium Voices:")
        for availableVoice in availableVoices.filter({ voice in
            voice.quality == .premium
        }) {
            print("--- start ---")
            print(availableVoice.name)
            print(availableVoice.identifier)
            print(availableVoice.language)
            print("--- end ---")
        }
        
        // list enhanced voices
        print("Enhanced Voices:")
        for availableVoice in availableVoices.filter({ voice in
            voice.quality == .enhanced
        }) {
            print("--- start ---")
            print(availableVoice.name)
            print(availableVoice.identifier)
            print(availableVoice.language)
            print("--- end ---")
        }
        
        // list enhanced voices
        print("Default Voices:")
        for availableVoice in availableVoices.filter({ voice in
            voice.quality == .default
        }) {
            print("--- start ---")
            print(availableVoice.name)
            print(availableVoice.identifier)
            print(availableVoice.language)
            print("--- end ---")
        }
    }
}
