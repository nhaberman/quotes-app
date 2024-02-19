//
//  AddQuoteView.swift
//  Quotes
//
//  Created by Nick Haberman on 2/18/24.
//

import SwiftUI

struct AddQuoteView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var quoteText = ""
    @State private var quoteTime = Date()
    @State private var quoteTags = [String]()
    @State private var isPreviousQuote: Bool = false
    
    private var isQuoteValid: Bool {
        quoteText != ""
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Quote") {
                    TextField("Text", text: $quoteText, axis: .vertical)
                        .lineLimit(3...)
                }
                
                Section("Time") {
                    Toggle(isOn: $isPreviousQuote, label: {
                        Text("Previous Quote")
                    })
                    if isPreviousQuote {
                        DatePicker("Time Said", selection: $quoteTime)
                    }
                }
                
//                Section("Tags") {
//                    Text("TBD")
//                }
                
                Button {
                    saveQuote()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
                .disabled(!isQuoteValid)
            }
            .navigationTitle("Add Quote")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark.circle.fill")
                    }
                }
            }
        }
    }
    
    private func saveQuote() {
        withAnimation {
            let newQuote = Quote(quoteText: quoteText, quoteTime: quoteTime, quoteTags: quoteTags)
            modelContext.insert(newQuote)
        }
    }
}

#Preview {
    AddQuoteView()
}
