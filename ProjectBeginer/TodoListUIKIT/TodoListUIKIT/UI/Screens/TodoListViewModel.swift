//
//  TodoListViewModel.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/17/25.
//

import Foundation
import SwiftData
class TodoListViewModel {
    private let databaseService: DatabaseService
    weak var delegate: TodoListViewModelDelegate?
    private var tasks: [TodoModel] = []
    
    init(databaseService: DatabaseService = .shared) {
        self.databaseService = databaseService
        loadTasks()
    }
    
    func loadTasks() {
        guard let context = databaseService.context else { return }
        do {
            let descriptor = FetchDescriptor<TodoModel>(sortBy: [SortDescriptor(\.time, order: .reverse)])
            tasks = try context.fetch(descriptor)
            delegate?.didUpdateTasks()
        } catch {
            delegate?.didReceiveError(error)
        }
    }
    
    func numberOfTasks() -> Int {
        return tasks.count
    }
    
    func task(at index: Int) -> TodoModel {
        return tasks[index]
    }
    
    func addTask(_ taskName: String) {
        databaseService.saveTask(taskName: taskName)
        loadTasks()
    }
    
    func updateTask(_ task: TodoModel, with newName: String) {
        databaseService.updateTask(task: task, newTaskName: newName)
        loadTasks()
    }
    
    func deleteTask(_ task: TodoModel) {
        databaseService.deleteTask(task: task)
        loadTasks()
    }
}
