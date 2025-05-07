//
//  CounterAction.swift
//  TCA
//
//  Created by Việt Anh Trần on 27/4/25.
//
import ComposableArchitecture


enum CounterAction: Equatable {
    case incrementButtonTapped
    case decrementButtonTapped
}

@Reducer
struct CounterReducer {
    struct State: Equatable {
        var count = 0
    }

    enum Action: Equatable {
        case incrementButtonTapped
        case decrementButtonTapped
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .incrementButtonTapped:
            state.count += 1
            return .none
            
        case .decrementButtonTapped:
            state.count -= 1
            return .none
        }
    }
}
