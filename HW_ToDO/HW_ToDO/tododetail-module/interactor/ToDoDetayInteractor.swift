//
//  ToDoDetayInteractor.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class ToDoDetayInteractor : PresenterToInteractorToDoDetayProtocol {
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: targetPath).appendingPathComponent("records.sqlite")
        db = FMDatabase(path: dbURL.path)
    }
    func toDoGuncelle(toDo_id: Int, toDo_content: String) {
        // print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
        db?.open()
        do {
            try db!.executeUpdate("UPDATE todos SET todo_content = ? WHERE todo_id = ?", values: [toDo_content,toDo_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}


