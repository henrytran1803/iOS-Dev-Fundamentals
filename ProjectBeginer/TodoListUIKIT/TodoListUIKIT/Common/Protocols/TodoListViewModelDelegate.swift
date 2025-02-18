//
//  TodoListViewModelDelegate.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/17/25.
//

protocol TodoListViewModelDelegate: AnyObject {
    func didUpdateTasks()
    func didReceiveError(_ error: Error)
}
