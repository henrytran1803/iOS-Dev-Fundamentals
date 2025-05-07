//
//  CounterView.swift
//  TCASwiftUI
//
//  Created by Việt Anh Trần on 27/4/25.
//


import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 20) {
                Text("Count: \(viewStore.count)")
                    .font(.largeTitle)
                
                HStack(spacing: 20) {
                    Button("-") {
                        viewStore.send(.decrementButtonTapped)
                    }
                    Button("+") {
                        viewStore.send(.incrementButtonTapped)
                    }
                }
            }
            .padding()
        }
    }
}