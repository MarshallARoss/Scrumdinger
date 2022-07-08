//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Marshall  on 7/4/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    //@State private var scrums = DailyScrum.sampleData
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                    do  {
                        try await ScrumStore.save(scrums: store.scrums)
                    } catch {
                       errorWrapper = ErrorWrapper(error: error, guidance: "Try Again Later.")
                    }
                }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Sample data Loaded.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }

        }
    }
}
