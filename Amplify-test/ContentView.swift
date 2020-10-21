//
//  ContentView.swift
//  Amplify-test
//
//  Created by Robert Aung on 10/21/20.
//

import Amplify
import AmplifyPlugins
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear {
                self.performOnAppear()
            }
    }

//    func performOnAppear() {
//        let item = Todo(name: "Finish quarterly taxes",
//                        priority: .high,
//                        description: "Taxes are due for the quarter next week")
//
//        Amplify.DataStore.save(item) { result in
//            switch(result) {
//            case .success(let savedItem):
//                print("Saved item: \(savedItem.name)")
//            case .failure(let error):
//                print("Could not save item to datastore: \(error)")
//            }
//        }
//    }
    func performOnAppear() {
       Amplify.DataStore.query(Todo.self,
                               where: Todo.keys.priority.eq(Priority.high)) { result in
           switch(result) {
           case .success(let todos):
               for todo in todos {
                   print("==== Todo ====")
                   print("Name: \(todo.name)")
                   if let priority = todo.priority {
                       print("Priority: \(priority)")
                   }
                   if let description = todo.description {
                       print("Description: \(description)")
                   }
               }
           case .failure(let error):
               print("Could not query DataStore: \(error)")
           }
       }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
