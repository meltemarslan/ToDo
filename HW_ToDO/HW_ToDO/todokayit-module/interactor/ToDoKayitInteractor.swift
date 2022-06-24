//
//  ToDoKayitInteractor.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class ToDoKayitInteractor : PresenterToInteractorToDoKayitProtocol {
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: targetPath).appendingPathComponent("records.sqlite")
        db = FMDatabase(path: dbURL.path)
    }
    
    
    func toDoKayit(toDo_content: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO todos (todo_content) VALUES (?)", values: [toDo_content])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}

