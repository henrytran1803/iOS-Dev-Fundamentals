//
//  ViewModelType.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/17/25.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
