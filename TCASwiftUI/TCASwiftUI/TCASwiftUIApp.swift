//
//  TCASwiftUIApp.swift
//  TCASwiftUI
//
//  Created by Việt Anh Trần on 27/4/25.
//

import SwiftUI
import ComposableArchitecture
@main
struct TCASwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(
                store: Store(
                    initialState: CounterFeature.State(),
                    reducer: { CounterFeature() }
                )
            )
        }
    }
}
