//
//  DatabaseService.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/17/25.
//

import SwiftData
import Foundation

class DatabaseService {
    static var shared = DatabaseService()
    var container: ModelContainer?
    var context: ModelContext?

    init() {
        do {
            container = try ModelContainer(for: TodoModel.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            print("Error initializing database container:", error)
        }
    }
    func saveTask(taskName: String?) {
          guard let taskName = taskName else { return }
            if let context = context {
              let taskToBeSaved = TodoModel(
                  id: UUID().uuidString,
                  taskname: taskName,
                  time: Date().timeIntervalSince1970
              )
            context.insert(taskToBeSaved)
          }
      }
    func updateTask(task: TodoModel, newTaskName: String) {
        let taskToBeUpdated = task
        taskToBeUpdated.taskname = newTaskName
    }
    
    func deleteTask(task: TodoModel){
      guard let context = context else {
          print("Error: Context is nil")
          return
      }
        context.delete(task)
      }
}
