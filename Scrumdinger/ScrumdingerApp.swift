//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Edwin Mbaabu on 1/31/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper : ErrorWrapper?
    var body: some Scene {
        WindowGroup {
//            MeetingView()
            ScrumsView(scrums: $store.scrums){
                Task{
                    do{
                        try await store.save(scrums: store.scrums)
                    }catch{
                        errorWrapper = ErrorWrapper(error: error, guidance: "Please try again later.")
                    }
                }
            }
                .task {
                    do{
                        try await store.load()
                    }catch{
                        errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                    }
                }
                .sheet(item: $errorWrapper){
                    store.scrums = DailyScrum.sampleData
                    
                }content: { wrapper in
                    ErrorView(errorWrapper: wrapper)
                    
                }
        }
    }
}
