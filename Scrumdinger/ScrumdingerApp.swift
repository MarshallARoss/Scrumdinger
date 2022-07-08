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
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                    do  {
                        try await ScrumStore.save(scrums: store.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
                }
            }
//            .onAppear {{
//                ScrumStore.load { result in
//                    switch result {
//                    case .failure(let error):
//                        fatalError(error.localizedDescription)
//                    case .success(let scrums):
//                        store.scrums = scrums
//                    }
//                }
//            }}
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
